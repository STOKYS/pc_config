#!/bin/bash

VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2*100}')

if [ "$BLOCK_BUTTON" = "1" ]; then
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+
fi

if [ "$BLOCK_BUTTON" = "3" ]; then
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-
fi

echo "Volume: $VOL%"
