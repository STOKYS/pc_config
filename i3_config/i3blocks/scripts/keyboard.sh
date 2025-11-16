#!/bin/bash

KB=$(xset -q | awk '/LED mask:/ {print $10}')

case $KB in
	00000000) L="US" ;;
	00001000) L="CZ" ;;
	*) L="??" ;;
esac 

echo "Layout: $L"
