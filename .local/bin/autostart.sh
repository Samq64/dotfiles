#!/bin/sh
swaybg -m fill -i ~/.local/share/wallpaper &
waybar &
wl-clip-persist -c regular &
mako &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
udiskie &
swayidle &
