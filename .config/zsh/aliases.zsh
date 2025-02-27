alias v="nvim"
alias l="ls -Alh --color=always --group-directories-first"
alias gs="git status"
alias gc="git commit -m"
alias gd="git diff --staged"
alias rgrep="grep -Irn --color=auto"
alias pm="pacman"
alias pms="pacman -Ss"
alias pmc="pacman -Qdtq | sudo pacman -Rns - "

function pmi() {
    packages=("$@")
    if [ ${#packages[@]} -eq 0 ]; then
        # Select interactively with fzf if there are no arguments
        packages=($(pacman -Slq | fzf -m --preview 'pacman -Si {1}'))
        echo "Selected for installation: $packages\n"
    fi
    [ ${#packages[@]} -gt 0 ] && sudo pacman -S --needed "${packages[@]}"
}

function pmr() {
    packages=("$@")
    if [ ${#packages[@]} -eq 0 ]; then
        # Select interactively with fzf if there are no arguments
        packages=($(pacman -Qeq | fzf -m --preview 'pacman -Qi {1}'))
        echo "Selected for removal: $packages\n"
    fi
    [ ${#packages[@]} -gt 0 ] && sudo pacman -Rns "${packages[@]}"
}

# Change working directory with Yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
