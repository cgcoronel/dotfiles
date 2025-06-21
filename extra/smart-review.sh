#!/bin/bash

# Configuration
BRANCH_BASE="devel"
TEMP_DIR="/tmp"
DIFF_FILE="$TEMP_DIR/pr.diff"
REVIEW_FILE="$TEMP_DIR/cursor_review.txt"

# Cleanup function
echo "Cleaning up..."
rm -f "$DIFF_FILE" "$REVIEW_FILE"

# Verify we are in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: You are not in a git repository"
    exit 1
fi

# Get current branch
FEATURE=$(git rev-parse --abbrev-ref HEAD)

# Verify base branch exists
if ! git rev-parse --verify "$BRANCH_BASE" > /dev/null 2>&1; then
    echo "Error: Branch '$BRANCH_BASE' does not exist"
    exit 1
fi

# Update devel branch to latest version
echo "Updating $BRANCH_BASE branch to latest version..."
if ! git fetch origin "$BRANCH_BASE:$BRANCH_BASE"; then
    echo "Error: Failed to update $BRANCH_BASE branch"
    exit 1
fi
echo "Successfully updated $BRANCH_BASE branch"

# Check if there are differences
if git diff --quiet "$BRANCH_BASE".."$FEATURE"; then
    echo "No differences between $BRANCH_BASE and $FEATURE"
    exit 0
fi

# Generate diff
git diff "$BRANCH_BASE".."$FEATURE" > "$DIFF_FILE"

# Create review file
LAST_COMMIT=$(git log -1 --pretty=format:"%h - %s (%an)")
COMMENT="Comparing $BRANCH_BASE against $FEATURE\nLast commit: $LAST_COMMIT"
echo -e "$COMMENT\n\n$(cat "$DIFF_FILE")" > "$REVIEW_FILE"

# Copy prompt to clipboard
echo "Please do a code review of these differences, comment on possible improvements, bugs, anything you can find" | pbcopy

# Open in cursor
cursor "$REVIEW_FILE"
