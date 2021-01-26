#!/bin/sh

vpn="$(nmcli -t -f name,type connection show --order name --active 2>/dev/null | grep vpn | head -1 | cut -d ':' -f 1)"

connected=#33FA2A
disconnected=#282C34

if [ -n "$vpn" ]; then
	echo "  %{F$connected}%{F-}"
#    echo "  %{F$connected}vpn%{F-}"
else
	echo "  %{F$disconnected}%{F-}"
#    echo "  %{F$disconnected}vpn%{F-}"


fi
