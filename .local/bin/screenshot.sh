#!/bin/sh
path=~/img/screenshots/$(date +%F_%H-%M-%S).png

case $XDG_CURRENT_DESKTOP in
    "Hyprland")
        # https://www.reddit.com/r/hyprland/comments/1cbetfa/comment/mbg9o4y/
        monitor="$(hyprctl monitors | awk '/Monitor/{mon=$2} /focused: yes/{print mon}')";;
    "mango")
        monitor="$(mmsg -g -o | awk '$2 == "selmon" && $3 == 1 {print $1}')"
esac

if [ "$1" = area ]; then
    still -p -c 'grim -g "$(slurp -d)" - | wl-copy'
else
    grim -c -o "$monitor" - | wl-copy
fi

mkdir -p "$(dirname "$path")"
if [ "$(wl-paste -l)" = image/png ]; then
    wl-paste > "$path"
    notify-send -u low "Screenshot copied and saved to $path"
fi
