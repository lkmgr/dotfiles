#!/bin/bash

killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar --reload main & disown
done

# polybar main 2>&1 | tee -a /tmp/polybar.log & disown

