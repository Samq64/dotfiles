# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set prompt to [user@hostname directory]$
PS1='[\u@\h \W]\$ '

# Exports
export TERM='xterm-256color'
export HISTFILE="$XDG_STATE_HOME/bash/history"
export HISTCONTROL='ignoreboth'

# Aliases
alias vi='nvim'
alias gs='git status'
alias aur='yay'

alias ls='exa -A --group-directories-first --icons=auto'
alias grep='grep -rin --color=auto'
