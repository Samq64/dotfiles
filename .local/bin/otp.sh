#!/bin/sh
set -e
selection=$(basename -as .gpg $PASSWORD_STORE_DIR/totp/* | rofi -dmenu -p "")
PASSWORD_STORE_CLIP_TIME=5 pass otp -c "totp/$selection"
notify-send -u low "2FA code for $selection copied to clipboard"
