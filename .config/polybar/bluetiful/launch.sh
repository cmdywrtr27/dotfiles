#!/bin/bash

DIR="$HOME/.config/polybar/bluetiful"

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q main -c "$DIR"/config.ini &
polybar -q main2 -c "$DIR"/config.ini &
#polybar -q main3 -c "$DIR"/config.ini &
