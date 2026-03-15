#!/usr/bin/env bash

REPO="ncipollo/actions-playground"
TMPDIR=$(mktemp -d)

TAG=$(gh release list --repo "$REPO" --limit 1 --json tagName --jq '.[0].tagName')
echo "Fetching release $TAG text files..."
gh release download "$TAG" --repo "$REPO" --pattern "*.txt" --dir "$TMPDIR"

echo ""
for f in "$TMPDIR"/*.txt; do
    [[ -e "$f" ]] || { echo "No .txt files found."; break; }
    echo "=== $(basename "$f") ==="
    tail "$f"
    echo ""
done
