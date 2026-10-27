#!/bin/bash

# Smart Commit Generator
# Requirements: git, jq, curl, OPENAI_API_KEY

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuration
MODEL=${OPENAI_MODEL:-"gpt-6-luna"}
TEMPERATURE=${OPENAI_TEMPERATURE:-"0.2"}
MAX_TOKENS=${OPENAI_MAX_TOKENS:-"150"}
MAX_DIFF_LINES=${MAX_DIFF_LINES:-1500}
DEBUG=${DEBUG:-0}

# Messages
error() {
    printf "${RED}Error:${NC} %s\n" "$1" >&2
    exit 1
}

info() {
    printf "${BLUE}Info:${NC} %s\n" "$1" >&2
}

success() {
    printf "${GREEN}Success:${NC} %s\n" "$1"
}

warning() {
    printf "${YELLOW}Warning:${NC} %s\n" "$1" >&2
}

# Check dependencies
check_dependencies() {
    local dep

    for dep in git jq curl; do
        if ! command -v "$dep" >/dev/null 2>&1; then
            error "$dep is required but not installed"
        fi
    done
}

# Check configuration
check_config() {
    if [[ -z "${OPENAI_API_KEY:-}" ]]; then
        error "OPENAI_API_KEY environment variable is not set"
    fi

    if ! git rev-parse --is-inside-work-tree \
        >/dev/null 2>&1; then
        error "Not in a git repository"
    fi

    if ! git diff --cached --quiet --exit-code; then
        return 0
    fi

    error "No staged changes. Use 'git add' first."
}

# Validate Conventional Commits
validate_commit_message() {
    local message="$1"

    local pattern='^(feat|fix|docs|style|refactor|test|chore|perf|ci|build|revert)(\([a-zA-Z0-9._/-]+\))?(!)?: .+'

    if [[ ! "$message" =~ $pattern ]]; then
        warning "Invalid Conventional Commits format:"
        printf '  %s\n' "$message" >&2
        return 1
    fi

    return 0
}

# Truncate diff safely
truncate_diff() {
    local diff_content="$1"
    local line_count

    line_count=$(printf '%s\n' "$diff_content" | wc -l)
    line_count=${line_count//[[:space:]]/}

    if (( line_count > MAX_DIFF_LINES )); then
        warning "Diff has $line_count lines. Limiting to $MAX_DIFF_LINES."

        printf '%s\n' "$diff_content" |
            sed -n "1,${MAX_DIFF_LINES}p"
    else
        printf '%s\n' "$diff_content"
    fi
}

# Show staged diff
show_diff() {
    local diff_content="$1"

    printf "\n${BLUE}=== Staged Changes ===${NC}\n"
    printf '%s\n' "$diff_content"
    printf "${BLUE}======================${NC}\n\n"
}

# Generate commit message with OpenAI
generate_commit_message() {
    local diff_content="$1"
    local prompt
    local json_payload
    local response
    local response_body
    local http_code
    local commit_msg
    local error_msg

    prompt="Analyze the following staged Git diff and generate
exactly one Conventional Commits message.

Rules:
- Write in English.
- Use imperative mood.
- Return exactly one line.
- Do not use quotes, Markdown, or explanations.
- Do not end with a period.
- Prefer concise descriptions.
- Describe the intent, not just the changed files.
- Use a scope only when it adds useful context.
- Never invent changes not present in the diff.

Allowed types:
feat, fix, docs, style, refactor, test,
chore, perf, ci, build, revert

Expected format:
type(scope): short description

Git diff:

$diff_content"

    # Build JSON payload
    if ! json_payload=$(jq -n \
        --arg model "$MODEL" \
        --arg prompt "$prompt" \
        --arg temperature "$TEMPERATURE" \
        --arg max_tokens "$MAX_TOKENS" \
        '{
            model: $model,
            reasoning_effort: "none",
            messages: [
                {
                    role: "system",
                    content: "Generate valid Conventional Commits messages. Return only the commit message."
                },
                {
                    role: "user",
                    content: $prompt
                }
            ],
            temperature: ($temperature | tonumber),
            max_completion_tokens: ($max_tokens | tonumber)
        }'); then
        error "Failed to build JSON payload"
    fi

    if [[ "$DEBUG" == "1" ]]; then
        info "Model: $MODEL"
        printf '%s\n' "$json_payload" >&2
    fi

    # API request
    response=$(curl -sS \
        --connect-timeout 10 \
        --max-time 90 \
        -w '\n%{http_code}' \
        https://api.openai.com/v1/chat/completions \
        -H "Authorization: Bearer $OPENAI_API_KEY" \
        -H "Content-Type: application/json" \
        -d "$json_payload") || {
            error "Unable to connect to OpenAI API"
        }

    # Separate HTTP status and body
    http_code=$(printf '%s\n' "$response" | tail -n 1)
    response_body=$(printf '%s\n' "$response" | sed '$d')

    if [[ "$DEBUG" == "1" ]]; then
        info "HTTP status: $http_code"
        printf '%s\n' "$response_body" | jq '.' >&2
    fi

    # Validate HTTP response
    if [[ "$http_code" != "200" ]]; then
        error_msg=$(printf '%s\n' "$response_body" |
            jq -r '.error.message // "Unknown API error"' \
            2>/dev/null)

        error "OpenAI API ($http_code): ${error_msg:-Unknown error}"
    fi

    # Validate JSON
    if ! printf '%s\n' "$response_body" |
        jq -e . >/dev/null 2>&1; then
        error "Invalid JSON response from OpenAI"
    fi

    # Extract generated message
    commit_msg=$(printf '%s\n' "$response_body" |
        jq -r '.choices[0].message.content // empty')

    if [[ -z "$commit_msg" ]]; then
        error "OpenAI returned an empty commit message"
    fi

    # Clean output
    commit_msg=$(printf '%s' "$commit_msg" |
        tr -d '\r' |
        sed -n '1p' |
        sed 's/^[[:space:]]*//;s/[[:space:]]*$//' |
        sed 's/^"//;s/"$//')

    if [[ -z "$commit_msg" ]]; then
        error "Commit message is empty after cleaning"
    fi

    printf '%s\n' "$commit_msg"
}

# Main
main() {
    local diff_content
    local commit_msg
    local choice

    printf " ${BLUE}🤖 Smart Commit Generator${NC}\n"

    check_dependencies
    check_config

    # Get staged changes
    diff_content=$(git diff --cached --no-ext-diff --no-color) ||
        error "Failed to read staged changes"

    if [[ -z "$diff_content" ]]; then
        error "No staged diff available"
    fi

    # Truncate large diffs
    diff_content=$(truncate_diff "$diff_content") ||
        error "Failed to process diff"

    # Optional diff display
    if [[ "${1:-}" == "--show-diff" ]]; then
        show_diff "$diff_content"
    fi

    # Generate message
    commit_msg=$(generate_commit_message "$diff_content") ||
        error "Failed to generate commit message"

    # Validate message before committing
    if ! validate_commit_message "$commit_msg"; then
        error "Generated message does not follow Conventional Commits"
    fi

    # Show suggestion
    printf " ${GREEN}Message:${NC} ${YELLOW}\"%s\"${NC}\n" \
        "$commit_msg"

    printf " Confirm? [Y/n] "
    read -r choice

    # Default to yes
    choice=${choice:-y}
    choice=$(printf '%s' "$choice" |
        tr '[:upper:]' '[:lower:]')

    if [[ "$DEBUG" == "1" ]]; then
        info "User choice: $choice"
    fi

    case "$choice" in
        y|yes)
            if git commit -m "$commit_msg"; then
                success "Commit created successfully!"
            else
                error "Git commit failed"
            fi
            ;;
        n|no)
            warning "Commit cancelled"
            ;;
        *)
            error "Invalid option: $choice"
            ;;
    esac
}

main "$@"

