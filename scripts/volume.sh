#!/usr/bin/env bash
# Adapted from https://wiki.archlinux.org/title/Dunst#Using_dunstify_as_volume/brightness_level_indicator
# Usage: volume.sh {toggle|X%+|X%-} [mic]

if [[ $2 = mic ]]; then
    prefix=Microphone
    device=@DEFAULT_SOURCE@
else
    prefix=Volume
    device=@DEFAULT_SINK@
fi

if [[ $1 = toggle ]]; then
    wpctl set-mute $device toggle
else
    wpctl set-volume $device "$1"
fi

notify_opts=(--urgency low --hint string:x-dunst-stack-tag:volume)
volume=$(wpctl get-volume $device | awk '{print $2*100}')
muted=$(wpctl get-volume $device | awk '{print $3}')

if [[ $volume = 0 || $muted = '[MUTED]' ]]; then
    notify-send "${notify_opts[@]}" "${prefix} muted"
else
    notify-send "${notify_opts[@]}" --hint int:value:"$volume" "${prefix}: ${volume}%"
fi

[[ -z $2 ]] && canberra-gtk-play --id audio-volume-change
