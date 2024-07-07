#!/bin/sh
# TODO: Show screenshot in notification and option to save
selection=$(slurp)
grim -c -g "$selection" - | wl-copy
notify-send "Screenshot copied to clipboard."
