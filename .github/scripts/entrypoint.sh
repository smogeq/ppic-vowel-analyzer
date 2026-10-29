#!/bin/bash
# Activity 8: the script the Docker container runs when it starts.
set -e

FILE="${FILE:-data.txt}"

echo "Starting vowel frequency analyzer on ${FILE}..."
FREQ_RESULT=$(python3 /app/.github/scripts/frequency.py "/app/${FILE}")
echo "Result: ${FREQ_RESULT}"

bash /app/.github/scripts/update_readme.sh "${FREQ_RESULT}" "${GITHUB_USER}"

echo "Analysis complete: README.md updated."
