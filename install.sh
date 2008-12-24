#!/bin/sh

for file in *; do
  if [ "$file" != "`basename $0`" ]; then
    dest="$HOME/.$file"
    echo "Installing $file to $dest"
    cp "$file" "$dest"
  fi
done
