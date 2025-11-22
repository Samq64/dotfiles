#!/bin/sh
pid_file="$XDG_STATE_HOME/record_pid"
if [ -s "$pid_file" ]; then
    kill "$(cat "$pid_file")"
    rm "$pid_file"
else
    path="$HOME/videos/screencap/$(date +%F_%H-%M-%S).mkv"
    if [ "$1" = "area" ]; then
        wf-recorder -g "$(slurp)" -f "$path" &
    else
        monitor="$(mmsg -g -o | awk '{ if($3 == 1 && $2 == "selmon") print $1}')"
        wf-recorder -o "$monitor" -f "$path" &
    fi
    echo $! > "$pid_file"
fi
pkill -RTMIN+10 waybar
