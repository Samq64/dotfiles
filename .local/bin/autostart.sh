#!/bin/sh
wm=$XDG_CURRENT_DESKTOP
[ "$wm" = "Hyprland" ] && wm=hypr

swaybg -m fill -i ~/.local/share/wallpaper &
waybar -c ~/.config/"$wm"/waybar.jsonc &
wl-clip-persist -c regular &
mako &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
swayidle &
