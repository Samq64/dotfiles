#!/bin/sh
if [ "$(nmcli networking connectivity)" = "none" ]; then
	nmcli networking on
else
	nmcli networking off
fi
