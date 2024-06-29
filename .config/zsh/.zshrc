setopt autocd prompt_subst interactive_comments
unsetopt beep
bindkey -e
stty stop undef # Disable Ctrl+S to freeze terminal

# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE
mkdir -p "$XDG_STATE_HOME/zsh"
HISTFILE="$XDG_STATE_HOME/zsh/history"
setopt share_history hist_ignore_all_dups hist_ignore_space

# Autocomplete
autoload -U compinit
mkdir -p "$XDG_CACHE_HOME/zsh"
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ''
_comp_options+=(globdots) # Include hidden files.

# Git
autoload -Uz add-zsh-hook vcs_info
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# Prompt
autoload -Uz colors && colors
PROMPT='%{$fg[magenta]%}%n@%M %{$fg[cyan]%}%~%{$reset_color%} %F{yellow}${vcs_info_msg_0_}%f$ '

# keybinds
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search      # Up arrow
bindkey "^[[B" down-line-or-beginning-search    # Down arrow

# Aliases
alias v="nvim"
alias l="exa -Al --group-directories-first --icons=auto"
alias gs="git status"
alias gd="git diff --staged"
alias pmi="sudo pacman -S"
alias pmr="sudo pacman -Rns"

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
