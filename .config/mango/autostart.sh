#!/bin/sh
gtklock &
swaybg -m fill -i ~/.local/share/wallpaper &
waybar -c ~/.config/mango/waybar.jsonc &
wl-clip-persist -c regular &
mako &
lxpolkit &
swayidle &
# Fix screensharing
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots &
