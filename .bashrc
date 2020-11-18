##########
#  bash  #
##########

# if non-interactive, do nothing
[ -z "$PS1" ] && return

# de-dupe/space in command history
HISTCONTROL=ignoredups:ignorespace

# don't overwrite history
shopt -s histappend

# history length
HISTSIZE=1000
HISTFILESIZE=2000

# auto resize window
shopt -s checkwinsize

# include functions
if [ -f ~/.config/bash/functions ]; then
    . ~/.config/bash/functions
fi

# include aliases
if [ -f ~/.config/bash/aliases ]; then
    . ~/.config/bash/aliases
fi

# default prompt
export PS1="\t: \W$ "

# git info prompt
if [ -f ~/.config/git/prompt ]; then
    source ~/.config/git/prompt
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUPSTREAM="auto"
    PS1='\t:\[\033[32m\]$(__git_ps1 " (%s)")\[\033[00m\] \W$ '
fi

export PS1
