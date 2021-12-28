#!/bin/bash

killall -q polybar

while pgrep -x polybar > /dev/null; do sleep 0.25; done

echo "--- RESTART ---" | tee -a /tmp/polybar.log

PB_CONFIG=$HOME/.config/polybar/config.ini

MONITOR=HDMI-0 polybar --reload --config=$PB_CONFIG main 2>&1 | tee -a /tmp/polybar.log & disown
MONITOR=DP-0 polybar --reload --config=$PB_CONFIG secondary 2>&1 | tee -a /tmp/polybar.log & disown

# MONITOR=HDMI-0 polybar --reload --config=$PB_CONFIG main_left 2>&1 | tee -a /tmp/polybar.log & disown
# MONITOR=HDMI-0 polybar --reload --config=$PB_CONFIG main_center 2>&1 | tee -a /tmp/polybar.log & disown
# MONITOR=HDMI-0 polybar --reload --config=$PB_CONFIG main_right 2>&1 | tee -a /tmp/polybar.log & disown
# MONITOR=DP-0 polybar --reload --config=$PB_CONFIG secondary_left 2>&1 | tee -a /tmp/polybar.log & disown
# MONITOR=DP-0 polybar --reload --config=$PB_CONFIG secondary_center 2>&1 | tee -a /tmp/polybar.log & disown
# MONITOR=DP-0 polybar --reload --config=$PB_CONFIG secondary_right 2>&1 | tee -a /tmp/polybar.log & disown

# Same bar on all monitors
# for m in $(polybar --list-monitors | cut -d":" -f1); do
#   MONITOR=$m polybar --reload main & disown
# done

