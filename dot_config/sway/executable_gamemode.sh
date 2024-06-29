#!/usr/bin/env bash

mainMon="DP-1"
leftMon="DP-2"

is_enabled() {
  swaymsg -t get_outputs | jq -r ".[] | select(.name == \"$1\") | .active"
}

if [ $(is_enabled $leftMon) = "true" ]; then
  echo "Disabling left monitor"
  swaymsg output $leftMon disable
  swaymsg output $mainMon position 0 0 scale 1
else
  echo "Enabling left monitor"
  swaymsg output $leftMon enable
  swaymsg output $mainMon position 1440 390 scale 1.25
fi
