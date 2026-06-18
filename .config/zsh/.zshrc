setopt autocd prompt_subst interactive_comments
unsetopt beep
stty stop undef # Disable Ctrl+S freezing terminal

# Aliases
alias v='nvim'
alias l='ls -Alh --color=always --group-directories-first'
alias rm='rm -I'
alias dots='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias lazydots='lazygit --git-dir $HOME/.dotfiles --work-tree $HOME'

# Change working directory with Yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

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
zstyle ':vcs_info:git:*' formats '%F{yellow} %b'
zstyle ':vcs_info:git:*' actionformats '%F{red} %b (%a)'

# Prompt
autoload -Uz colors && colors
PROMPT='%F{magenta}%n@%M %F{cyan}%~%(?.. %F{red}[%?])%f $ '
RPROMPT='${vcs_info_msg_0_}'

# keybinds
bindkey -e
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search      # Up arrow
bindkey "^[[B" down-line-or-beginning-search    # Down arrow

# Dim zsh-autosuggestions on TTY
if [[ $TERM == linux ]]; then
    export TERM=xterm-256color
fi

# Plugins
if [ -x "$(command -v fzf)" ]; then
    source <(fzf --zsh)
    # Rebind to Alt+D
    bindkey '\ed' fzf-cd-widget
fi
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
