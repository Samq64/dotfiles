#!/bin/sh
action=$(printf \
"Lock
Sleep
Log out
Shutdown
Hibernate
Restart
Quick restart" | rofi -dmenu -i -l 7 -p "")

case $action in
    "Log out")
        hyprctl dispatch exit;;
    "Shutdown")
        systemctl poweroff;;
    "Hibernate")
        systemctl hibernate;;
    "Restart")
        systemctl reboot;;
    "Quick restart")
        systemctl soft-reboot;;
    "Sleep")
        systemctl suspend;;
    "Lock")
        loginctl lock-session;;
esac
