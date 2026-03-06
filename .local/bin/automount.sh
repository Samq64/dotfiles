#!/usr/bin/env bash
udisksctl monitor | while IFS= read -r line; do
    [[ "$line" =~ block_devices ]] || continue

    case "$line" in
        *"Removed"*|*"Changed"*)
             pkill -RTMIN+1 waybar
             continue
             ;;
        *"Added"*)
            dev="/dev/$(basename "${line##*/}")"
            udisksctl info -b "$dev" | grep -q "HintAuto: *true" || continue
            findmnt -rn -S "$dev" >/dev/null && continue
            udisksctl mount -b "$dev" || continue
            pkill -RTMIN+1 waybar
            ;;
    esac
done
