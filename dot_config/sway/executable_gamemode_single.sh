#!/usr/bin/env bash

# Get the current scale of monitor DP-1
current_scale=$(swaymsg -t get_outputs | jq -r '.[] | select(.name=="DP-1") | .scale')

# Check the current scale and run corresponding commands
if [ "$current_scale" = "1.25" ]; then
    swaymsg output DP-1 position 0 0 scale 1
    swaymsg input "type:pointer" pointer_accel 0.85
elif [ "$current_scale" = "1.0" ]; then
    swaymsg output DP-1 position 0 0 scale 1.25
    swaymsg input "type:pointer" pointer_accel 0.6
else
    echo "Unsupported scale value: $current_scale"
fi

