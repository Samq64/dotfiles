[ -f "$ZDOTDIR/aliases.zsh" ] && source "$ZDOTDIR/aliases.zsh"
setopt autocd prompt_subst interactive_comments
unsetopt beep
stty stop undef # Disable Ctrl+S to freeze terminal
TERM=xterm-256color # For zsh-autosuggestions on TTY

# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE
mkdir -p "$XDG_STATE_HOME/zsh"
HISTFILE="$XDG_STATE_HOME/zsh/history"
setopt hist_ignore_all_dups hist_ignore_space

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
zstyle ':vcs_info:git:*' formats '(%b)'

# Prompt
autoload -Uz colors && colors
PROMPT='%{$fg[magenta]%}%n@%M %{$fg[cyan]%}%~%{$reset_color%} $ '
RPROMPT='%F{yellow}${vcs_info_msg_0_}%f'

# keybinds
bindkey -e
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search      # Up arrow
bindkey "^[[B" down-line-or-beginning-search    # Down arrow

# Plugins
if [ -x "$(command -v fzf)" ]; then
    source <(fzf --zsh)
    # Rebind to Alt+D
    bindkey '\ed' fzf-cd-widget
fi
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
