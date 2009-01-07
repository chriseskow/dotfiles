# Environment variables
export PATH=~/Code/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/X11/bin:/usr/local/texlive/2008basic/bin/universal-darwin
export CLICOLOR=1
export LSCOLORS=excxfxdxbxegedabagacgx
export COPYFILE_DISABLE=true

# Prompt
prompt() {
  local NONE="\[\e[0m\]"
  local RED="\[\e[31m\]"
  local GREEN="\[\e[32m\]"
  local BLUE="\[\e[34m\]"
  local PROMPT="[$GREEN\u$NONE@$RED\h$NONE:$BLUE\w$NONE]\\$ "
  export PS1=$PROMPT
  export SUDO_PS1=$PROMPT
}
prompt

# Functions
rmdsstore() {
  find ${1:-.} -name .DS_Store -print -delete
}

# Aliases
alias ..="cd .."
alias ls="ls -hF"
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"
alias grep="grep --color=auto"
alias gvim="mvim"
alias stuff="open ~/Documents/stuff.txt"

# Git completion
if [ -e ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
