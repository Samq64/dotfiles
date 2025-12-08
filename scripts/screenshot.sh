#!/bin/sh
set -euo
path=~/img/screenshots/$(date +%F_%H-%M-%S).png

case $XDG_CURRENT_DESKTOP in
    "Hyprland")
        # https://www.reddit.com/r/hyprland/comments/1cbetfa/comment/mbg9o4y/
        monitor="$(hyprctl monitors | awk '/Monitor/{mon=$2} /focused: yes/{print mon}')";;
    "mango")
        monitor="$(mmsg -g -o | awk '{ if($3 == 1 && $2 == "selmon") print $1}')";;
esac

grim -c -o "$monitor" - | wl-copy
wl-paste > "$path"
notify-send -u low "Screenshot copied and saved to $path"
