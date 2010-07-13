if which fortune > /dev/null; then
  fortune
fi

if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi
