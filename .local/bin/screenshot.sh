#!/bin/sh
path=~/img/screenshots/$(date +%F_%H-%M-%S).png
monitor="$(mmsg -g -o | awk '{ if ($3 == 1 && $2 == "selmon") print $1}')"
if [ "$1" = "satty" ]; then
    grim -c -o "$monitor" -t ppm - | satty --output-filename $path --filename -
else
    grim -c -o "$monitor" - | wl-copy
    wl-paste > "$path" || exit 1
    notify-send -u low "Screenshot copied and saved to $path"
fi
