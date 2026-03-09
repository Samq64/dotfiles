#!/bin/sh
foot_opts=('--app-id=floaterm')
[[ "$1" == "--hold" ]] && foot_opts+=('--hold'); shift
cmd="sleep 0.1; $*" # Add delay for window rule to fully apply
exec foot "${foot_opts[@]}" sh -c "$cmd"
