#!/bin/sh
selection=$(printf \
"tile
scroller
grid
monocle
deck
center_tile
right_tile
vertical_scroller
vertical_tile
vertical_grid
vertical_deck
dwindle
fair
vertical_fair" | rofi -dmenu -i -l 14 -p "")

mmsg dispatch "setlayout,$selection"
