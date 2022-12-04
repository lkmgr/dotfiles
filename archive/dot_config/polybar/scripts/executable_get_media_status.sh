#!/bin/sh

PLAYER_STATUS=$(playerctl status 2> /dev/null)
ARTIST=$(playerctl metadata --format "{{ artist }}")
TITLE=$(playerctl metadata --format "{{ title }}")

if [ -z "$ARTIST" ]
then
  RESULT_STRING="$TITLE"
else
  RESULT_STRING="$ARTIST - $TITLE"
fi

if [ "$PLAYER_STATUS" = "Playing" ]; then
    echo "契 $RESULT_STRING"
elif [ "$PLAYER_STATUS" = "Paused" ]; then
    echo " $RESULT_STRING"
else
    echo "No player is running"
fi

