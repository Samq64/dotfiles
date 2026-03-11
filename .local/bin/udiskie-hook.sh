#!/bin/sh
event=$1
device=$2

case "$event" in
    device_mounted)
        waybar-drives.sh "$device"
        pkill -RTMIN+1 waybar
        ;;
    device_added|device_unmounted|device_removed)
        pkill -RTMIN+1 waybar
        ;;
esac
