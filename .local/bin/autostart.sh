#!/bin/sh
wm=$XDG_CURRENT_DESKTOP
[ "$wm" = "Hyprland" ] && wm=hypr

hyprlock &
swaybg -m fill -i ~/.local/share/wallpaper &
waybar -c ~/.config/"$wm"/waybar.jsonc &
wl-clip-persist -c regular &
mako &
lxpolkit &
swayidle &
