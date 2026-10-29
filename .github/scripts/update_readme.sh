#!/bin/bash
# Activity 7: append the vowel frequency result to README.md, then commit and push.
# Usage: update_readme.sh "<frequency result>" "<github username>"
set -e

FREQ_RESULT="$1"
GITHUB_USER="${2:-unknown}"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo -e "\n### Update by ${GITHUB_USER} on ${TIMESTAMP}\n- Vowel frequency in data.txt: ${FREQ_RESULT}" >> README.md

# Give the commit an author, since no person is running this.
git config --global user.name "github-actions"
git config --global user.email "github-actions@users.noreply.github.com"

git add README.md
git commit -m "Update README with vowel frequency (pushed by ${GITHUB_USER})" || echo "No changes to commit"

# Set SKIP_PUSH=true to test locally without pushing.
if [ "${SKIP_PUSH:-false}" != "true" ]; then
  git push origin HEAD:main
fi
