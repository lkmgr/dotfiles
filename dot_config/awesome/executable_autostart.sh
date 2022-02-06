#!/bin/sh

/home/lukas/.fehbg &
pgrep -x picom > /dev/null || picom --config ~/.config/picom.conf &
pgrep -x playerctld > /dev/null || playerctld daemon &

