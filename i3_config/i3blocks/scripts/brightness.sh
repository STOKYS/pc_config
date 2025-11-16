#!/bin/bash

MAX=$(brightnessctl max)
NOW=$(brightnessctl get)
MIN=$(( MAX / 20 ))

PERCENT=$(( NOW * 100 / MAX ))

if [ "$BLOCK_BUTTON" = "1" ]; then 
	brightnessctl set +5%
fi

if [ "$BLOCK_BUTTON" = "3" ]; then 
	brightnessctl set 5%-
fi

if (( NOW < MIN )); then
	brightnessctl set 5%
fi

echo "Brightness: $PERCENT%"

