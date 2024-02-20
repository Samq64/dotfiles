fish_add_path ~/.local/bin

if status is-interactive
    set fish_greeting
    set TERM "xterm-256color"
    set EDITOR "nvim"
    set -x MANPAGER "nvim +Man!"

    alias vi='nvim'
    alias gs='git status'
    alias aur='yay'
    alias cat='bat'
    alias ls='exa -A --group-directories-first --icons=auto'
    alias grep='grep -rin --color=auto'

    alias pm='pacman'
    alias pmi='sudo pacman -S'
    alias pmr='sudo pacman -Rns'

    starship init fish | source
end
