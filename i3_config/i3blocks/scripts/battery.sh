#!/bin/bash

PER=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status | head -c 1)

echo "Battery: $PER% [$STATUS]"
