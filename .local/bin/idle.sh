# Based on the swayidle man page example
swayidle -w \
	timeout 300 'gtklock -i' \
	timeout 600 'swaymsg "output * dpms off"' \
		resume 'swaymsg "output * dpms on"' \
	before-sleep 'gtklock -i'
