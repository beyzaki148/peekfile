#!/bin/bash

# 1. Check if the file argument is provided
if [ -z "$1" ]; then
    echo "Error: You must provide a file name."
    exit 1
fi

FILE="$1"

# 2. Default X to 3 if the second argument is not provided
X="${2:-3}"

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: '$FILE' file not found."
    exit 1
fi

# Get the total number of lines in the file
total_lines=$(wc -l < "$FILE")

# Calculate the 2X threshold
threshold=$((2 * X))

# 3. Condition: If total lines are 2X or less, print the full content; otherwise, show warning and preview
if [ "$total_lines" -le "$threshold" ]; then
    cat "$FILE"
else
    echo "Warning: File has $total_lines lines (exceeds 2 x $X)."
    head -n "$X" "$FILE"
    echo "..."
    tail -n "$X" "$FILE"
fi
