#!/bin/sh
action=$(printf "Lock\nSleep\nLog out\nShutdown\nHibernate\nRestart\nQuick restart" | rofi -dmenu -i -l 7 -p "")

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
        hyprlock;;
esac
