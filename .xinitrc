#!/bin/sh

nm-applet &
picom -b --experimental-backends &
feh --bg-scale $HOME/Pictures/New\ Wallpapers/polyblue.jpg &
#nitrogen --restore &
dunst &
sxhkd &
[ -n "$(pidof mpd)" ] || mpd &
#mpd &
xsetroot -cursor_name left_ptr &
xrdb -load $HOME/.Xresources &
bash $HOME/.screenlayout/triple.sh &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xfce4-power-manager &
bash ~/.local/bin/gofaster &
bash ~/.config/polybar/bluetiful/launch.sh &
#tint2 -c ~/.config/tint2/tint2rc &
plank &

session=${1:-openbox-session}

case $session in
    openbox           ) exec openbox-session;;
    i3|i3wm           ) exec i3;;
    bspwm             ) exec bspwm;;
    xfwm|xfwm4        ) exec xfwm4;;
    berry             ) exec berry;;
    *                 ) exec $1;;
esac
