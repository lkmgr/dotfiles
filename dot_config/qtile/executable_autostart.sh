#!/bin/sh

run() { pkill -x "$1"; { sleep 0.1; "$@" & }; }

run picom --config ~/.config/picom.conf
run dunst
run playerctld daemon

