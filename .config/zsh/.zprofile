if [[ -z $DISPLAY && -z $WAYLAND_DISPLAY && $XDG_VTNR = 1 ]]; then
    exec dbus-run-session mango
fi
