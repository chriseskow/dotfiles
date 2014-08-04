#!/bin/sh

if [ "$1" = "-h" -o "$1" = "--help" -o $# -gt 1 ]; then
  echo "Usage: $0 [hostname]"
  exit
fi

git submodule update --init --recursive

SRC="`dirname $0`"

if [ -n "$1" ]; then
  DEST="$1:~"
else
  DEST="$HOME"
fi

rsync -av --exclude=.git --exclude=.gitmodules $SRC/.[a-z]* "$DEST"
