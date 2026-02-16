#!/bin/bash

# First argument: Primary monitor
# Second argument: Secondary monitor

# Find the first connected output that isn't eDP-1
INTERNAL=$1
EXTERNAL=$(swaymsg -t get_outputs |
    jq -r ".[] | select(.name != \"${INTERNAL}\") | .name" |
    head -n 1)

echo $INTERNAL
echo $EXTERNAL
if [[ -z $EXTERNAL ]]; then
    echo "No external monitor found."
    echo "Making sure the internal is enabled."
    swaymsg output "$INTERNAL" enable
    exit 0
fi

case $2 in
internal)
    swaymsg output "$EXTERNAL" disable
    swaymsg output "$INTERNAL" enable
    ;;
external)
    swaymsg output "$INTERNAL" disable
    swaymsg output "$EXTERNAL" enable
    ;;
dual)
    swaymsg output "$INTERNAL" enable
    swaymsg output "$EXTERNAL" enable
    ;;
*)
    echo "Usage: $0 <internal monitor> {internal|external|dual}"
    echo "  - internal: Use internal monitor only"
    echo "  - external: Use external monitor only"
    echo "  - dual: Use both monitors"
    echo "Received: $0 $1 $2"
    exit 1
    ;;
esac
