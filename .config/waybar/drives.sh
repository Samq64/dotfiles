#!/usr/bin/env bash
shopt -s nullglob

state_file='/tmp/waybar_drive_index'
drives=(/run/media/"$USER"/*)
total=${#drives[@]}

if (( total == 0 )); then
    echo 0 > "$state_file"
    echo '{"text":""}'
    exit
fi

read -r index < "$state_file" 2>/dev/null || index=0

case "$1" in
    prev) index=$(( (index - 1 + total) % total )) ;;
    next) index=$(( (index + 1) % total )) ;;
    open) xdg-open "${drives[$index]}" ;;
    unmount)
        device=$(findmnt -no SOURCE --target "${drives[$index]}")
        output=$(udisksctl unmount -b "$device" 2>&1)
        status=$?
        if [ $status -eq 0 ]; then
            notify-send "Unmounted $device"
        elif echo "$output" | grep -qi "busy"; then
            notify-send -u critical "Cannot unmount $device: An operation is pending or the device is busy."
        else
            notify-send -u critical "Failed to unmount $device"
        fi
        exit
        ;;
esac

index=$(( index % total ))
echo "$index" > "$state_file"

mountpoint="${drives[$index]}"
device=$(findmnt -no SOURCE --target "$mountpoint")

text=" $(basename "$mountpoint")"
[[ total -gt 1 ]] && text+=" ($((index + 1))/$total)"

tooltip="Device: $device\nMounted at $mountpoint"
printf '{"text":"%s","tooltip":"%s"}\n' "$text" "$tooltip"
