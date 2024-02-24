HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
setopt PROMPT_SUBST
bindkey -e


# The following lines were added by compinstall
zstyle :compinstall filename '/home/sam/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Set prompt
#source '/usr/share/git/completion/git-prompt.sh'
#PS1='%F{3}%n@%m %F{6}%~%F{4}$(__git_ps1)%f %(?.🡲.%F{1}X%f) '
eval "$(starship init zsh)"

# Aliases
alias vi='nvim'
alias gs='git status'
alias aur='yay'
alias cat='bat'
alias ls='exa -A --group-directories-first --icons=auto'
alias grep='grep -rin --color=auto'

