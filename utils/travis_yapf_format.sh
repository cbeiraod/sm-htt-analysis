#!/bin/bash

BASE_COMMIT=$(git rev-parse $TRAVIS_BRANCH)
echo "Running yapf against branch $TRAVIS_BRANCH with commit $BASE_COMMIT."
echo

COMMIT_FILES=$(git diff --name-only $BASE_COMMIT | grep -i .py)
if [ -z "$COMMIT_FILES" ]; then
    echo "No files changed with postfix .py."
    exit 0
fi
echo "Changed files with postfix .py:"
for FILE in $COMMIT_FILES; do
    echo $FILE
done
echo

echo "Yapf diff on changed files:"
yapf --diff $COMMIT_FILES
RESULT_OUTPUT=$(yapf --diff $COMMIT_FILES)

if [ -z "$RESULT_OUTPUT" ]; then
    echo "Yapf did not apply any formatting."
    exit 0
fi
echo "Please fix the formatting using the diff shown above."
exit 1
