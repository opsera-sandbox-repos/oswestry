#!/bin/bash

# Your file path
file_path="test3.js"

# Line to add
new_line="// This is a new line added by the script. $1"

# Add a line to the file
echo "$new_line" >> "$file_path"

# Git commands to stage and commit changes
git add "$file_path"
git commit -m "DT-$2 Automated Commit $1"
git pull
git push
