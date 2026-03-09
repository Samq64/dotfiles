#!/bin/sh
foot_opts=('--app-id=floaterm')
if [[ "$1" == "--hold" ]]; then
    foot_opts+=('--hold')
    shift
fi
cmd="sleep 0.1; $*" # Add delay for window rule to fully apply
exec foot "${foot_opts[@]}" sh -c "$cmd"
