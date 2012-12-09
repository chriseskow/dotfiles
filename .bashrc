# Environment variables
export HISTSIZE=1000000
export EDITOR=vim
export PAGER=less
export LESS=-R

# PATH
for DIR in \
  "/usr/X11/bin" \
  "/usr/local/sbin" \
  "/usr/local/bin" \
  "$HOME/bin" \
  "$HOME/Code/bin"
do
  if [ -d "$DIR" ]; then
    PATH="$DIR:$PATH"
  fi
done
PATH="$(echo "$PATH" | awk -v RS=: -v ORS=: '!($0 in a) {a[$0]; print}')"
PATH="${PATH%:}"
export PATH
unset DIR

# Prompt
NONE="\[\033[0m\]"
RED="\[\033[31m\]"
GREEN="\[\033[32m\]"
YELLOW="\[\033[33m\]"
BLUE="\[\033[34m\]"
type -t __git_ps1 | grep -q function || function __git_ps1 { false; }
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PS1="$NONE[$GREEN\u$NONE@$RED\h$NONE:$BLUE\w$NONE\$(__git_ps1 ' ($YELLOW%s$NONE)')]\\$ "
export SUDO_PS1="$PS1"
unset NONE RED GREEN YELLOW BLUE

# Title
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'

# Check the window size after each command
shopt -s checkwinsize

# Share history across sessions
shopt -s histappend
export PROMPT_COMMAND="$PROMPT_COMMAND; history -a"

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias cp="cp -i"
alias mv="mv -i"
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"
alias df="df -h"
alias du="du -h"
alias g="git"

if which colordiff &>/dev/null; then
  alias diff="colordiff"
fi

# OS-specific configuration
case `uname` in
  Darwin)
    export COPYFILE_DISABLE=true
    export LSCOLORS=excxfxdxbxafadababaggx
    alias ls="ls -hFG"
    alias grep="grep --color=auto"
    rmdsstore() {
      find ${1:-.} -name .DS_Store -print -delete
    }
    ;;
  Linux)
    export LS_COLORS="di=34:ln=32:so=35:pi=33:ex=31:bd=90;45:cd=90;43:su=90;41:sg=90;41:tw=90;46:ow=36:mi=90;42"
    alias ls="ls -hF --color=auto"
    alias grep="grep --color=auto"
    alias ff="firefox &"
    ;;
  SunOS)
    alias ls="ls -F"
    ;;
  *)
    alias ls="ls -F"
esac

# Run any additional shell scripts
for FILE in $HOME/.bash.d/*.sh; do
  if [ -f "$FILE" ]; then
    source "$FILE"
  fi
done

unset FILE

# Bash completion
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
fi
