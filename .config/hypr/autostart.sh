#!/bin/sh
gtklock &
swaybg -m fill -i "$HOME/.local/share/wallpaper" &
waybar -c "$HOME/.config/hypr/waybar.json" &
wl-clip-persist -c regular &
mako &
lxpolkit &
swayidle &
