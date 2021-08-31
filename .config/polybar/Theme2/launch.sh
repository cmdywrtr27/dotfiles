#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar -c ~/.config/polybar/Theme2/config top1 &
#polybar -c ~/.config/polybar/Theme2/config bottom1 &

# VGA1
polybar -c ~/.config/polybar/Theme2/config top2 &
#polybar -c ~/.config/polybar/Theme2/config bottom2 &
