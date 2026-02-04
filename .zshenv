export PATH="$HOME/.local/bin":$PATH
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export FZF_DEFAULT_COMMAND='rg --files --hidden'

export TERMINAL="foot"
export FLOATERM="foot --app-id floaterm"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Move some junk out of $HOME
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle/config"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DVDCSS_CACHE="$XDG_DATA_HOME/dvdcss"
export GOPATH="$XDG_DATA_HOME/go"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NUGET_PACKAGES="$XDG_CACHE_HOME/NuGetPackages"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
