#!/bin/bash

FEATURE=`git rev-parse --abbrev-ref HEAD`
rm /tmp/pr.diff
rm /tmp/cursor_review.txt

git diff "devel".."$FEATURE" > /tmp/pr.diff

COMMENT="Comparando devel contra $FEATURE"

echo "$COMMENT\n\n$(cat /tmp/pr.diff)" > /tmp/cursor_review.txt

cursor /tmp/cursor_review.txt
