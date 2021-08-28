#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar -c ~/.config/polybar/Purple_Paradise/config.ini main &
polybar -c ~/.config/polybar/Purple_Paradise/config.ini second &
