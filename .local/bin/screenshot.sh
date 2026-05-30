#!/usr/bin/env bash
path=~/img/screenshots/$(date +%F_%H-%M-%S).png
monitor="$(mmsg get all-monitors | jq -r '.monitors[] | select(.active == true) | .name')"

case $1 in
    area)
        still -p -c 'grim -g "$(slurp -d)" - | wl-copy'
        ;;
    monitor)
        grim -c -o "$monitor" - | wl-copy
        ;;
    window)
        # Remove 2px border from all sides
        geometry=$(mmsg get focusing-client | jq -r '"\(.x+2),\(.y+2) \(.width-4)x\(.height-4)"')
        [ -z "$geometry" ] && notify-send 'No window focused!' && exit 1
        grim -c -g "$geometry" - | wl-copy
        ;;
    esac

mkdir -p "$(dirname "$path")"
if [ "$(wl-paste -l)" = image/png ]; then
    wl-paste > "$path"
    notify-send -u low "${1^} screenshot copied and saved to $(basename $path)"
fi
