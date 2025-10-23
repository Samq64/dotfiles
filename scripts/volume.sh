#!/bin/sh
# Adapted from https://wiki.archlinux.org/title/Dunst#Using_dunstify_as_volume/brightness_level_indicator
# Usage: power.sh {toggle|X%+|X%-} [mic]

msgTag="volume"
if [ "$2" = "mic" ]; then
    prefix=Microphone
    device=@DEFAULT_SOURCE@
else
    prefix=Volume
    device=@DEFAULT_SINK@
fi

if [ "$1" = "toggle" ]; then
    wpctl set-mute $device toggle
else
    wpctl set-volume -l 1.5 $device "$1"
fi

volume=$(wpctl get-volume $device | awk '{print$2*100}')
mute=$(wpctl get-volume $device | awk '{print$3}')
if [ "$volume" -eq 0 ] || [ "$mute" = "[MUTED]" ]; then
    # Show the sound muted notification
    notify-send -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "${prefix} muted"
else
    # Show the volume notification
    notify-send -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "${prefix}: ${volume}%"
fi

[ -z "$2" ] && canberra-gtk-play -i audio-volume-change -d "changeVolume"
