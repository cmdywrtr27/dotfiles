#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Top Bar
polybar -c ~/.config/polybar/Theme1/config hdmi &
polybar -c ~/.config/polybar/Theme1/config vga &

# Bottom Bar
#polybar -c ~/.config/polybar/Theme1/config bhdmi1 &
#polybar -c ~/.config/polybar/Theme1/config bhdmi2 &
