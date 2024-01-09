HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
setopt PROMPT_SUBST
bindkey -e

source '/usr/share/git/completion/git-prompt.sh'

# The following lines were added by compinstall
zstyle :compinstall filename '/home/sam/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Set prompt
PS1='%F{3}%n@%m %F{6}%~%F{4}$(__git_ps1)%f %(?.🡲.%F{1}X%f) '

# Exports
export TERM='xterm-256color'
export PATH=~/.local/bin:$PATH
export EDITOR='nvim'

# Aliases
alias vi='nvim'
alias gs='git status'

alias ls='ls -A --color=auto --group-directories-first'
alias grep='grep -rin --color=auto'
