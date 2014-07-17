#!/bin/sh

if [ "x$1" = "x-h" -o "x$1" = "x--help" -o $# -gt 1 ]; then
  echo "Usage: $0 [hostname]"
  exit
fi

SRC="`dirname $0`"

if [ -n "$1" ]; then
  DEST="$1:~"
else
  DEST="$HOME"
fi

for f in $SRC/.*; do
  f=$(basename $f)
  if [[ ! $f =~ ^(\.|\.\.|\.git|\.gitmodules)$ ]]; then
    echo $f
    rsync -av "$SRC/$f" "$DEST/$f"
  fi
done
