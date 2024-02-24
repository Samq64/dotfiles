#!/bin/bash
action=$(echo -e "Lock\nSleep\nLog out\nShutdown\nHibernate\nRestart\nQuick restart" | rofi -dmenu -i -l 7 -p "")

if [[ $action == "Log out" ]]; then
    hyprctl dispatch exit
elif [[ $action == "Shutdown" ]]; then
    systemctl poweroff
elif [[ $action == "Hibernate" ]]; then
    systemctl hibernate
elif [[ $action == "Restart" ]]; then
    systemctl reboot
elif [[ $action == "Quick restart" ]]; then
    systemctl soft-reboot
elif [[ $action == "Sleep" ]]; then
    systemctl suspend
elif [[ $action == "Lock" ]]; then
    hyprlock
fi
