#!/bin/bash
action=$(echo -e "Log out\nShutdown\nReboot\nSoft reboot\nSleep\nLock" | rofi -dmenu -p "")
if [[ $action == "Log out" ]]; then
    hyprctl dispatch exit
elif [[ $action == "Shutdown" ]]; then
    systemctl poweroff
elif [[ $action == "Reboot" ]]; then
    systemctl reboot
elif [[ $action == "Soft reboot" ]]; then
    systemctl soft-reboot
elif [[ $action == "Sleep" ]]; then
    systemctl suspend
elif [[ $action == "Lock" ]]; then
    gtklock -i
fi
