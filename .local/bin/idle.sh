# From the swayidle man page
swayidle -w \
	timeout 300 'swaylock -f -c 111111' \
	timeout 600 'swaymsg "output * dpms off"' \
		resume 'swaymsg "output * dpms on"' \
	before-sleep 'swaylock -f -c 111111'
