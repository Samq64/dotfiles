#!/bin/sh
path=~/img/screenshots/$(date +%F_%H-%M-%S).png

case $XDG_CURRENT_DESKTOP in
    "Hyprland")
        # https://www.reddit.com/r/hyprland/comments/1cbetfa/comment/mbg9o4y/
        monitor="$(hyprctl monitors | awk '/Monitor/{mon=$2} /focused: yes/{print mon}')";;
    "mango")
        monitor="$(mmsg -g -o | awk '$2 == "selmon" && $3 == 1 {print $1}')"
esac

if [ "$1" = "area" ]; then
    grim -c -o "$monitor" -t ppm - | satty --output-filename "$path" --filename -
    tmp=$(mktemp --suffix=.png)
    grim -t ppm -o "$monitor" "$tmp"
    swayimg --slideshow -f -a overlay "$tmp" &
    pid=$!
    grim -g "$(slurp -d)" - | wl-copy
    kill $pid
    rm "$tmp"
else
    grim -c -o "$monitor" - | wl-copy
fi

mkdir -p "$(dirname "$path")"
wl-paste > "$path" || exit 1
notify-send -u low "Screenshot copied and saved to $path"
