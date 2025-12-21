#!/bin/sh
selection=$(printf \
"T (Tile)
G  (Grid)
M  (Monocle)
K  (Deck)
CT (Center Tile)
RT (Right Tile)
VS (Vertical Scroller)
VT (Vertical Tile)
VG (Vertical Grid)
VK (Vertical Deck)
TG (Tile Grid Mix)
S  (Scroller)" | rofi -dmenu -i -l 12 -p "")

layout="$(echo "$selection" | awk '{print $1}')"
[ -n "$layout" ] && mmsg -l "$layout"
