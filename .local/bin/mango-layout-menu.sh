#!/bin/sh
selection=$(printf \
"T (Tile)
S  (Scroller)
G  (Grid)
M  (Monocle)
K  (Deck)
CT (Center Tile)
RT (Right Tile)
VS (Vertical Scroller)
VT (Vertical Tile)
VG (Vertical Grid)
VK (Vertical Deck)
DW (Dwindle)
F  (Fair)
VF (Vertical Fair)" | rofi -dmenu -i -l 14 -p "")

layout="$(echo "$selection" | awk '{print $1}')"
[ -n "$layout" ] && mmsg -l "$layout"
