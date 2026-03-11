#!/usr/bin/env bash
# Requires jq
# Device refresh is handled by udiskie

mapfile -t devices < <(
    lsblk --json --path -o NAME,SIZE,LABEL,PARTLABEL,MOUNTPOINT,FSTYPE,TYPE |
    jq -r '.. | objects | select(.type == "part" and .fstype != null and
            (.mountpoint == null or (.mountpoint | test("^/(run/)?media/")))
        )
        | "\(.name)|\(.fstype)|\(.size)|\(.label // "")|\(.partlabel // "")|\(.mountpoint // "")"
    '
)
readonly total=${#devices[@]}
(( total < 1 )) && { echo ""; exit; }

readonly state_file="$XDG_RUNTIME_DIR/waybar_drive_index"
read -r index < "$state_file" 2>/dev/null
index=${index:-0}
(( index >= total )) && index=$((total - 1))

update_device_info() {
    IFS='|' read -r device filesystem size label partlabel mountpoint <<< "${devices[$index]}"
    label=${label:-${partlabel:-${device##*/}}} # label > partlabel > device name
}

mount_and_open() {
    update_device_info
    if [[ -z $mountpoint ]] && ! udisksctl mount -b "$device"; then
        notify-send -u critical "Failed to mount $label ($device)"
        exit
    fi
    mountpoint=$(findmnt -n -o TARGET "$device")
    xdg-open "$mountpoint" &
    exit
}

unmount_drive() {
    update_device_info
    [[ -z "$mountpoint" ]] && exit
    if ! output=$(udisksctl unmount -b "$device" 2>&1); then
        if [[ ${output,,} == *busy* ]]; then
            notify-send "Drive is busy: $label ($device)"
        else
            notify-send -u critical "Failed to unmount $label ($device)"
        fi
    fi
    exit
}

case "$1" in
    /dev/*)
        for i in "${!devices[@]}"; do
            IFS='|' read -r dev _ <<< "${devices[$i]}"
            [[ $dev == "$1" ]] && { echo "$i" > "$state_file"; exit; }
        done
        exit ;;
    open) mount_and_open ;;
    unmount) unmount_drive ;;
    prev) index=$(( (index - 1 + total) % total )) ;;
    next) index=$(( (index + 1) % total )) ;;
esac

echo "$index" > "$state_file"
update_device_info

text=" $label"
(( total > 1 )) && text+=" ($(( index + 1))/$total)"

tooltip="Device: $device\nFilesystem: $filesystem\nSize: $size"
if [[ -n $mountpoint ]]; then
    tooltip+="\nMount: $mountpoint"
    class="mounted"
else
    tooltip+="\nUnmounted"
    class="unmounted"
fi

printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$text" "$tooltip" "$class"
