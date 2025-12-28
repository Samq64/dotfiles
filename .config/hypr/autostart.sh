#!/bin/sh
hyprlock &
swaybg -m fill -i ~/.local/share/wallpaper &
waybar -c ~/.config/hypr/waybar.jsonc &
wl-clip-persist -c regular &
mako &
lxpolkit &
swayidle &
