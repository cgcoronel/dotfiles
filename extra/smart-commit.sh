#!/bin/bash

# Colores para mejor UX
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuración por defecto (puede ser sobrescrita por variables de entorno)
MODEL=${OPENAI_MODEL:-"gpt-3.5-turbo"}
TEMPERATURE=${OPENAI_TEMPERATURE:-"0.4"}
MAX_TOKENS=${OPENAI_MAX_TOKENS:-"150"}

# Función para mostrar errores
error() {
    echo -e "${RED}Error:${NC} $1" >&2
    exit 1
}

# Función para mostrar información
info() {
    echo -e "${BLUE}Info:${NC} $1"
}

# Función para mostrar éxito
success() {
    echo -e "${GREEN}Success:${NC} $1"
}

# Función para mostrar advertencias
warning() {
    echo -e "${YELLOW}Warning:${NC} $1"
}

# Verificar dependencias
check_dependencies() {
    if ! command -v jq &> /dev/null; then
        error "jq is required but not installed. Please install jq first."
    fi
    
    if ! command -v curl &> /dev/null; then
        error "curl is required but not installed. Please install curl first."
    fi
}

# Verificar configuración
check_config() {
    if [[ -z "$OPENAI_API_KEY" ]]; then
        error "OPENAI_API_KEY environment variable is not set"
    fi
    
    # Verificar que estamos en un repositorio git
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        error "Not in a git repository"
    fi
}

# Validar formato del mensaje de commit
validate_commit_message() {
    local message="$1"
    
    # Patrón para Conventional Commits
    local pattern='^(feat|fix|docs|style|refactor|test|chore|perf|ci|build|revert)(\(.+\))?: .+'
    
    if [[ ! "$message" =~ $pattern ]]; then
        warning "Generated message doesn't follow Conventional Commits format:"
        echo "  $message"
        echo ""
        echo "Expected format: type(scope): description"
        echo "Types: feat, fix, docs, style, refactor, test, chore, perf, ci, build, revert"
        return 1
    fi
    
    return 0
}

# Mostrar el diff actual
show_diff() {
    local diff_content="$1"
    echo -e "\n${BLUE}=== Staged Changes ===${NC}"
    echo "$diff_content"
    echo -e "${BLUE}=====================${NC}\n"
}

# Generar mensaje de commit usando OpenAI
generate_commit_message() {
    local diff_content="$1"
    
    local prompt="You are an expert in generating Conventional Commits messages. 
Generate a single-line commit message that follows the Conventional Commits standard.
Use one of these prefixes: feat, fix, docs, style, refactor, test, chore, perf, ci, build, revert
Followed by a clear description in English, in imperative mood, without a period.
Return ONLY the commit message, no explanations or extra text.

Here's the diff to analyze:

$diff_content"

    local json_payload=$(jq -n \
        --arg model "$MODEL" \
        --arg prompt "$prompt" \
        --arg temperature "$TEMPERATURE" \
        --arg max_tokens "$MAX_TOKENS" \
        '{
            model: $model,
            messages: [
                {role: "system", content: "You are an expert Conventional Commits generator. Always respond with a single line following the format: type(scope): description"},
                {role: "user", content: $prompt}
            ],
            temperature: ($temperature | tonumber),
            max_tokens: ($max_tokens | tonumber)
        }')

    # Debug: mostrar payload si está habilitado
    if [[ "$DEBUG" == "1" ]]; then
        echo "Debug: JSON payload:" >&2
        echo "$json_payload" >&2
    fi

    local response=$(curl -s -w "\n%{http_code}" https://api.openai.com/v1/chat/completions \
        -H "Authorization: Bearer $OPENAI_API_KEY" \
        -H "Content-Type: application/json" \
        -d "$json_payload")
    
    # Extraer HTTP code y response body de forma compatible con macOS
    local http_code=$(echo "$response" | tail -n1)
    local response_body=$(echo "$response" | sed '$d')
    
    # Debug: mostrar respuesta si está habilitado
    if [[ "$DEBUG" == "1" ]]; then
        echo "Debug: HTTP Code: $http_code" >&2
        echo "Debug: Response body:" >&2
        echo "$response_body" >&2
    fi
    
    if [[ "$http_code" != "200" ]]; then
        local error_msg=$(echo "$response_body" | jq -r '.error.message // .error.type // "Unknown error"' 2>/dev/null || echo "Failed to parse error message")
        error "API request failed with status $http_code: $error_msg"
    fi
    
    # Verificar que la respuesta es JSON válido
    if ! echo "$response_body" | jq empty 2>/dev/null; then
        error "Invalid JSON response from API"
    fi
    
    # Extraer el mensaje con mejor manejo de errores
    local commit_msg=""
    
    # Intentar diferentes formas de extraer el mensaje
    commit_msg=$(echo "$response_body" | jq -r '.choices[0].message.content // empty' 2>/dev/null)
    
    if [[ -z "$commit_msg" ]]; then
        # Intentar alternativa si la primera falla
        commit_msg=$(echo "$response_body" | jq -r '.choices[0].message.content' 2>/dev/null | grep -v '^null$' | head -1)
    fi
    
    if [[ -z "$commit_msg" ]]; then
        # Debug: mostrar estructura de la respuesta
        if [[ "$DEBUG" == "1" ]]; then
            echo "Debug: Full response structure:" >&2
            echo "$response_body" | jq '.' >&2
        fi
        error "Failed to extract commit message from API response. Response structure may have changed."
    fi
    
    # Limpiar el mensaje (remover comillas extra, espacios, etc.)
    commit_msg=$(echo "$commit_msg" | sed 's/^"//;s/"$//' | tr -d '\n\r' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    
    if [[ -z "$commit_msg" ]]; then
        error "Extracted commit message is empty after cleaning"
    fi
    
    echo "$commit_msg"
}

# Función principal
main() {
    echo -e "${BLUE}🤖 Smart Commit Generator${NC}"
    echo "================================"
    
    # Verificaciones iniciales
    check_dependencies
    check_config
    
    # Obtener diff de cambios staged
    local diff_content=$(git diff --cached)
    
    if [[ -z "$diff_content" ]]; then
        error "No staged changes to analyze. Use 'git add' to stage changes first."
    fi
    
    # Mostrar configuración actual
    info "Using model: $MODEL (temperature: $TEMPERATURE)"
    
    # Mostrar diff si se solicita
    if [[ "$1" == "--show-diff" ]]; then
        show_diff "$diff_content"
    fi
    
    # Generar mensaje de commit
    info "Generating commit message..."
    local commit_msg=$(generate_commit_message "$diff_content")
    
    if [[ -z "$commit_msg" ]]; then
        error "Failed to generate commit message"
    fi
    
    # Validar formato
    if ! validate_commit_message "$commit_msg"; then
        warning "The generated message doesn't follow Conventional Commits format"
    fi
    
    # Mostrar mensaje sugerido
    echo -e "\n${GREEN}Suggested commit message:${NC}"
    echo -e "${YELLOW}\"$commit_msg\"${NC}\n"
    
    # Opciones para el usuario
    echo "Options:"
    echo "  [Y] Use this message (default)"
    echo "  [e] Edit message"
    echo "  [n] Cancel"
    echo "  [r] Regenerate"
    
    read -p "Choose option [Y/e/n/r]: " choice
    
    # Normalizar la elección (vacío = y, lowercase)
    choice=${choice:-y}
    choice=$(printf '%s' "$choice" | tr '[:upper:]' '[:lower:]')
    
    # Debug: mostrar la elección si está habilitado
    if [[ "$DEBUG" == "1" ]]; then
        echo "Debug: User choice: '$choice'" >&2
    fi
    
    case "$choice" in
        y|yes)
            git commit -m "$commit_msg"
            success "Commit created successfully!"
            ;;
        e|edit)
            # Permitir editar el mensaje
            echo "$commit_msg" > /tmp/commit_msg.txt
            ${EDITOR:-vim} /tmp/commit_msg.txt
            local edited_msg=$(cat /tmp/commit_msg.txt | tr -d '\n')
            rm /tmp/commit_msg.txt
            
            if [[ -n "$edited_msg" ]]; then
                git commit -m "$edited_msg"
                success "Commit created with edited message!"
            else
                warning "Empty commit message, operation cancelled"
            fi
            ;;
        r|regenerate)
            echo "Regenerating..."
            exec "$0" "$@"
            ;;
        n|no|cancel)
            info "Operation cancelled"
            exit 0
            ;;
        *)
            error "Invalid option: $choice"
            ;;
    esac
}

# Ejecutar función principal
main "$@"