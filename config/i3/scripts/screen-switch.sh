#!/bin/bash

# First argument: Primary monitor
# Second argument: Secondary monitor
if  xrandr --listactivemonitors | grep -q "$2"; then
	xrandr --output "$1" --auto
	xrandr --output "$2" --off
    ~/.config/i3/scripts/resize_screen 1
elif  xrandr --listactivemonitors | grep -q "$1"; then
	xrandr --output "$2" --auto
	xrandr --output "$1" --off
    ~/.config/i3/scripts/resize_screen 1.3
else
	xrandr --output "$1" --auto
    ~/.config/i3/scripts/resize_screen 1
fi
