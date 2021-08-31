#!/bin/bash

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

run nm-applet
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run nitrogen --restore
run /home/josh/.local/bin/gofaster
run /home/josh/.screenlayout/awesome.sh
