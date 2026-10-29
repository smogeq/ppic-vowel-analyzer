"""Activity 6: count how often each vowel appears in a text file."""
import sys
from collections import Counter


def count_vowels(file_path):
    """Return a dict of vowel counts for the file, in a, e, i, o, u order."""
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            text = f.read().lower()
    except FileNotFoundError:
        print(f"Error: {file_path} not found.")
        sys.exit(1)

    counts = Counter(ch for ch in text if ch in "aeiou")
    return {vowel: counts.get(vowel, 0) for vowel in "aeiou"}


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python frequency.py <file_path>")
        sys.exit(1)

    print(count_vowels(sys.argv[1]))
