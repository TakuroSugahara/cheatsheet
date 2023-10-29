#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Please provide a commands .yml file."
    echo "ex) cheetsheet ./commands.yml"
    exit 1
fi

# 引数で指定されたYAMLファイルのパス
FILE="$1"

# 現在のディレクトリを取得
CURRENT_DIR=$(pwd)

# 現在のディレクトリと一致するディレクトリのコマンドを取得して表示
# yq e ".cheatsheet[] | select(.dir == \"$CURRENT_DIR\") | .cmds[]" "$FILE"

matching_dir=""
while read -r dir; do
  expanded_dir="${dir/\$HOME/$HOME}"
  if [[ "$expanded_dir" == "$CURRENT_DIR" ]]; then
    matching_dir="$dir"
    break
  fi
done < <(yq -r '.cheatsheet[].dir' "$FILE")

if [[ -z "$matching_dir" ]]; then
  yq e ".cheatsheet[] | select(.dir == null) | .cmds[]" "$FILE"
  exit 
fi

yq e ".cheatsheet[] | select(.dir == \"$matching_dir\") | .cmds[]" "$FILE"
