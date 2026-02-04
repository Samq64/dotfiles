alias v="nvim"
alias l="ls -Alh --color=always --group-directories-first"
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
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
