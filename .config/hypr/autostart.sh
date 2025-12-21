#!/bin/sh
hyprlock &
swaybg -m fill -i "$HOME/.local/share/wallpaper" &
waybar -c "$HOME/.config/hypr/waybar.jsonc" &
wl-clip-persist -c regular &
mako &
lxpolkit &
swayidle &
