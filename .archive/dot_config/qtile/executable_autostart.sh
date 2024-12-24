#!/bin/sh

run() { pkill -x "$1"; { sleep 0.1; "$@" & }; }

run picom --config ~/.config/picom.conf --experimental-backends
run dunst
run playerctld daemon

