export PATH="$HOME/.local/bin":$PATH
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export TERMINAL="foot"

export ELECTRON_OZONE_PLATFORM_HINT="auto"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Move some junk out of $HOME
export ANDROID_HOME="$XDG_DATA_HOME/android"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle/config"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export DVDCSS_CACHE="$XDG_CACHE_HOME/dvdcss"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
	exec hyprland
fi
