#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Please provide a commands .yml file."
    echo "ex) cheetsheet ./commands.yml"
    exit 1
fi

FILE="$1"

CURRENT_DIR=$(pwd)

matching_dir=""
while read -r dir; do
  expanded_dir="${dir/\$HOME/$HOME}"
  if [[ "$expanded_dir" == "$CURRENT_DIR" ]]; then
    matching_dir="$dir"
    break
  fi
done < <(yq -r '.cheatsheet[].dir' "$FILE")

# show cmds in all dir
yq e ".cheatsheet[] | select(.dir == null) | .cmds[]" "$FILE"

# show cmds in specific dir
if [[ -n "$matching_dir" ]]; then
  yq e ".cheatsheet[] | select(.dir == \"$matching_dir\") | .cmds[]" "$FILE"
  exit 
fi

