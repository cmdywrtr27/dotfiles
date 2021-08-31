#!/bin/bash
if pgrep -x "picom" > /dev/null
then
	killall picom
else
	picom -bcCGf -i 0.8 -e 0.8 --experimental-backends --config ~/.config/picom/picom.conf
fi
