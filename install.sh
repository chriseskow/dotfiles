#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
DIR=$(pwd)

if which git >/dev/null 2>&1; then
  git submodule update --init --recursive
fi

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
