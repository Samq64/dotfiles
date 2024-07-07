#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --output HDMI-1 --left-of DP-3 --rotate left

# Statusbar loop
while true; do
  muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
  if [ "$muted" = "yes" ]; then
    volume=🔇
  else
    volume=🔊$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)%
  fi
  date=$(date +"%F %R")
  xsetroot -name "$volume $date"
  sleep 5s
done &

picom &
feh --bg-fill --no-fehbg ~/.local/share/wallpaper.jpg
exec dwm
