#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
DIR=$(pwd)

git submodule update --init --recursive

for file in .[a-z]*; do
  if [ "$file" = '.git' -o "$file" = '.gitmodules' ]; then
    continue
  fi

  src="$DIR/$file"
  dest="$HOME/$file"

  if [ -e "$dest" -a ! -L "$dest" ]; then
    echo "Skipping $dest because it exists and isn't a symlink"
  else
    ln -nfs "$src" "$dest"
  fi
done
