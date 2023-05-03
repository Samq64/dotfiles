# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Exports
export TERM='xterm-256color'
export EDITOR='nvim'
export PATH=~/.local/bin:$PATH

# Aliases
alias ls='ls -A --color=auto'
alias vi='nvim'
alias gs='git status'
