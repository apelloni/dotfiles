#!/bin/bash

# First argument: Primary monitor
# Second argument: Secondary monitor
EXTERNAL_SCREEN=$(xrandr | grep " connected" | grep -Eo "^$2")

if  xrandr --listactivemonitors | grep -Eq " $2"; then
	xrandr --output "$1" --auto
	xrandr --output "$EXTERNAL_SCREEN" --off
    ~/.config/i3/scripts/resize_screen 1
elif  xrandr --listactivemonitors | grep -q "$1"; then
	xrandr --output "$EXTERNAL_SCREEN" --auto
	xrandr --output "$1" --off
    ~/.config/i3/scripts/resize_screen 1
#    sleep 1
#    ~/.config/i3/scripts/resize_screen 1.3
else
	xrandr --output "$1" --auto
    ~/.config/i3/scripts/resize_screen 1
fi
