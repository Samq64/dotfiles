HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/home/sam/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Set prompt to [user@hostname path]$
PS1='[%n@%m %/]$ '

# Exports
export TERM='xterm-256color'
export PATH=~/.local/bin:$PATH
export EDITOR='nvim'

# Aliases
alias vi='nvim'
alias gs='git status'

alias ls='ls -A --color=auto --group-directories-first'
alias grep='grep -rin --color=auto'
