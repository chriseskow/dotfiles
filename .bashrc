# Environment variables
export EDITOR=vim
export PAGER=less

# PATH
for DIR in \
  "/usr/local/sbin" \
  "/usr/local/bin" \
  "/opt/local/sbin" \
  "/opt/local/bin" \
  "/opt/local/lib/mysql5/bin" \
  "$HOME/bin" \
  "$HOME/Code/bin"
do
  if [ -d "$DIR" ]; then
    if [ -z "`echo $PATH | grep $DIR`" ]; then
      export PATH="$DIR:$PATH"
    fi
  fi
done

# MANPATH
for DIR in \
  "/usr/local/share/man" \
  "/opt/local/share/man" \
  "$HOME/share/man"
do
  if [ -d "$DIR" ]; then
    if [ -z "`echo $PATH | grep $DIR`" ]; then
      export MANPATH="$DIR:$MANPATH"
    fi
  fi
done

unset DIR

# Prompt
NONE="\[\033[0m\]"
RED="\[\033[31m\]"
GREEN="\[\033[32m\]"
BLUE="\[\033[34m\]"
export PS1="[$GREEN\u$NONE@$RED\h$NONE:$BLUE\w$NONE]\\$ "
export SUDO_PS1="$PS1"
unset NONE RED GREEN BLUE

# Title
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"

# Quick login aliases for work machines
if [ -n "`hostname | grep .rutgers.edu`" ]; then
  alias farside="ssh farside"
  alias aramis="ssh aramis"
  alias porthos="ssh porthos"
  alias research="ssh research"
  alias spock="ssh spock"
  alias trix="ssh trix"
  alias remus="ssh remus"
  alias paul="ssh -t farside 'ssh paul'"
  alias math="ssh -t farside 'ssh math'"
  alias euler="ssh -t farside 'rlogin euler'"
  alias igor="ssh -t farside 'rlogin igor'"
  alias alpha="ssh -t farside 'ssh www8.srv.lcsr'"
fi

# Functions
rgrep() {
  grep -R "$1" .
}

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
    unset MANPATH
    alias ls="ls -F"
    ;;
  *)
    alias ls="ls -F"
esac

# Host-specific configuration
case `hostname` in
  iroc.rutgers.edu|hacker.rutgers.edu|demigod.rutgers.edu)
    alias eos="gedit '$HOME/etc/eos.txt' &"
    ;;
  www8.srv.lcsr.rutgers.edu)
    export CVSROOT=/www/webroot
esac

# Bash completion
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
elif [ -f /opt/local/etc/bash_completion ]; then
  source /opt/local/etc/bash_completion
fi
