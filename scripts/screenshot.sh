#!/bin/sh
set -euo
path="$HOME/img/screenshots/$(date +%F_%H-%M-%S).png"
# https://www.reddit.com/r/hyprland/comments/1cbetfa/comment/mbg9o4y/
monitor="$(hyprctl monitors | awk '/Monitor/{mon=$2} /focused: yes/{print mon}')"
grim -c -o "$monitor" - | wl-copy
wl-paste > "$path"
notify-send -u low "Screenshot copied and saved to $path"
