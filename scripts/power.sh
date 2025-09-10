#!/bin/sh
action=$(printf \
"Shutdown
Reboot
Soft Reboot
Reboot into BIOS
Sleep
Lock
Log Out" | rofi -dmenu -i -l 7 -p "")

case $action in
    "Shutdown")
        systemctl poweroff;;
    "Reboot")
        systemctl reboot;;
    "Soft Reboot")
        systemctl soft-reboot;;
    "Reboot into BIOS")
        systemctl reboot --firmware-setup;;
    "Sleep")
        systemctl suspend;;
    "Lock")
        loginctl lock-session;;
    "Log Out")
        hyprctl dispatch exit;;
esac
