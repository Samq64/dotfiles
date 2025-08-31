#!/bin/sh
action=$(printf \
"Log out
Shutdown
Reboot
Soft Reboot
BIOS Reboot
Sleep
Lock" | rofi -dmenu -i -l 7 -p "")

case $action in
    "Log out")
        hyprctl dispatch exit;;
    "Shutdown")
        systemctl poweroff;;
    "Reboot")
        systemctl reboot;;
    "Soft Reboot")
        systemctl soft-reboot;;
    "BIOS Reboot")
        systemctl reboot --firmware-setup;;
    "Sleep")
        systemctl suspend;;
    "Lock")
        loginctl lock-session;;
    esac
