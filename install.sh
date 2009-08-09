#!/bin/sh

for file in *; do
  if [ "$file" != "`basename $0`" ]; then
    src="$PWD/$file"
    dest="$HOME/.$file"
    if [ -d "$dest" -a ! -L "$dest" ]; then
      echo "Warning: $dest is a non-symlinked directory, skipping $file"
    else
      rm -f "$dest"
      ln -fsv "$src" "$dest"
    fi
  fi
done
