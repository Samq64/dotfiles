#!/bin/sh
path=~/img/screenshots/$(date +%F_%H-%M-%S).png
monitor="$(mmsg -g -o | awk '{ if ($3 == 1 && $2 == "selmon") print $1}')"

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
