#!/bin/bash

FEATURE=`git rev-parse --abbrev-ref HEAD`
rm /tmp/pr.diff
rm /tmp/cursor_review.txt

git diff "devel".."$FEATURE" > /tmp/pr.diff

COMMENT="Comparando devel contra $FEATURE"

echo "$COMMENT\n\n$(cat /tmp/pr.diff)" > /tmp/cursor_review.txt
echo "Haceme code review de estas diferencias, comentame posibles mejoras, bugs, todo lo que puedas encontrar" | pbcopy

cursor /tmp/cursor_review.txt
