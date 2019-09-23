# Environment variables
export HISTSIZE=1000000
export EDITOR=vim
export PAGER=less
export LESS=-R

# Function for adding directories to PATH
pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1${PATH:+":$PATH"}"
  fi
}

# Function for sourcing files only if they exist
source_if_exists() {
  test -f "$1" && source "$1"
}

# Function to test if a function exists
function_exists() {
  declare -f "$1" > /dev/null
}

# Path
pathadd /usr/X11/bin
pathadd /usr/local/sbin
pathadd /usr/local/bin
pathadd "$HOME/bin"
pathadd "$HOME/Code/bin"

# Load bash completion
if [ -z "$BASH_COMPLETION" ]; then
  source_if_exists /etc/bash_completion
  source_if_exists /usr/local/etc/bash_completion
  source_if_exists /usr/share/git/completion/git-completion.bash
  source_if_exists /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

# Load Git's shell prompt helper function
if ! function_exists __git_ps1; then
  source_if_exists /usr/share/git/completion/git-prompt.sh
  source_if_exists /usr/share/git-core/contrib/completion/git-prompt.sh
  source_if_exists /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

  if ! function_exists __git_ps1; then
    source "$HOME/.git-prompt.sh"
  fi
fi

# Prompt
NONE="\[\033[0m\]"
RED="\[\033[31m\]"
GREEN="\[\033[32m\]"
YELLOW="\[\033[33m\]"
BLUE="\[\033[34m\]"

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PS1="$NONE[$GREEN\u$NONE@$RED\h$NONE:$BLUE\w$NONE\$(declare -f __git_ps1 > /dev/null && __git_ps1 ' ($YELLOW%s$NONE)')]\\$ "
export SUDO_PS1="$PS1"
unset NONE RED GREEN YELLOW BLUE

# Check the window size after each command
shopt -s checkwinsize

# Share history across sessions
shopt -s histappend
export PROMPT_COMMAND="history -a"

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
alias g="git"

if which colordiff &>/dev/null; then
  alias diff="colordiff"
fi

# Back up files and directories
bak() {
  for file in "$@"; do
    cp -a -- "$file" "$file.bak"
  done
}

# OS-specific configuration
case `uname` in
  Darwin)
    export COPYFILE_DISABLE=true
    export LSCOLORS=excxfxdxbxafadababaggx
    alias ls="ls -hG"
    alias grep="grep --color=auto"
    rmdsstore() {
      find ${1:-.} -name .DS_Store -print -delete
    }
    ;;
  Linux)
    export LS_COLORS="di=34:ln=32:so=35:pi=33:ex=31:bd=90;45:cd=90;43:su=90;41:sg=90;41:tw=90;46:ow=36:mi=90;42"
    alias ls="ls -h --color=auto"
    alias grep="grep --color=auto"
    alias ff="firefox &"
    ;;
esac

# Run local bash configuration
source_if_exists "$HOME/.bashrc.local"

unset FILE
