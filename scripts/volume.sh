#!/bin/sh

# Based on https://wiki.archlinux.org/title/Dunst#Using_dunstify_as_volume/brightness_level_indicator

msgTag="volume"

if [ "$1" = "toggle" ]; then
    wpctl set-mute @DEFAULT_SINK@ toggle
    wpctl set-mute @DEFAULT_SOURCE@ toggle
else
    wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ "$@"
fi

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print$2*100}')
mute=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print$3}')
if [ "$volume" -eq 0 ] || [ "$mute" = "[MUTED]" ]; then
    # Show the sound muted notification
    notify-send -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted"
else
    # Show the volume notification
    notify-send -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "Volume: ${volume}%"
fi

# Play the volume changed sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
