#!/bin/bash

PER=$(cat /sys/class/power_supply/BAT0/capacity)

if [ -z "$PER" ]; then
	exit 0
fi

STATUS=$(cat /sys/class/power_supply/BAT0/status | head -c 1)

echo "Battery: $PER% [$STATUS]"
echo "BAT: $PER%"
[ "$PER" -le 20 ] && echo "#FF8000"
