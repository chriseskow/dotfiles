#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"
DIR=$(pwd)

# Install git submodules
if which git >/dev/null 2>&1; then
  git submodule update --init --recursive
fi

# Old manual symlink installation
for file in .[a-z]*; do
  if [ "$file" = '.git' -o "$file" = '.gitmodules' -o "$file" = '.stowrc' ]; then
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

# New stow-based installation
stow */
