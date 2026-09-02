#!/bin/bash
# Swap a newly downloaded it-degree-comparison-vNN.html into the tracked file,
# commit it, and push. Run from anywhere.
set -e
REPO="/Users/corey/Documents/IT Degree Comparison"

# Use the file passed as $1, or auto-detect the newest it-degree-comparison-v*.html
# dropped straight into the repo folder (excludes the tracked index.html itself)
if [ -n "$1" ]; then
  SRC="$1"
else
  SRC=$(ls -t "$REPO"/it-degree-comparison-v*.html 2>/dev/null | head -1)
fi

if [ -z "$SRC" ] || [ ! -f "$SRC" ]; then
  echo "No source file found. Usage: update-notes.sh [path-to-new-file.html]"
  exit 1
fi

VERSION=$(basename "$SRC" .html | sed -E 's/.*-v([0-9]+).*/v\1/')
cd "$REPO"

if diff -q "$SRC" index.html >/dev/null 2>&1; then
  echo "No changes — $SRC is identical to the current index.html"
  rm -f "$SRC"
  exit 0
fi

cp "$SRC" index.html
git add index.html
git commit -q -m "${2:-$VERSION}"
git push -q
rm -f "$SRC"

echo "Updated to $VERSION, committed, pushed, and removed $SRC"
