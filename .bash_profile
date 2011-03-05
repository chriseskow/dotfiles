if which fortune &>/dev/null; then
  fortune -s
fi

if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi
