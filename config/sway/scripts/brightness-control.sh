#!/bin/bash
# This script uses depends on
#  - pulseaudio-ctl
#  - dracula-icons-git
#  - dunst

# Execute pulseaudio command
CMD="$1"
#pulseaudio-ctl $CMD

BRIGHTNESS_MAX=$(brightnessctl max)
BRIGHTNESS_VAL=$(brightnessctl get)
BRIGHTNESS_PERC=$(bc <<< "scale=4; $BRIGHTNESS_VAL/$BRIGHTNESS_MAX*100" \
                    | xargs printf "%.0f")

# keyborad ICON=gpm-brightness-kbd
# screen ICON=gpm-brightness-lcd
case "$CMD" in
    up)
        ICON=gpm-brightness-lcd
        if [[ $BRIGHTNESS_PERC -ge 40 ]] then
            brightnessctl set +15%
        elif [[ $BRIGHTNESS_PERC -ge 10 ]] then
            brightnessctl set +10%
        else
            brightnessctl set $(($(brightnessctl get)*2))
        fi
        # If it was set to zero we bump it up to 10%
        [[ $(brightnessctl get) -eq 0 ]] && brightnessctl set +10%
        ;;
    down)
        ICON=gpm-brightness-lcd
        if [[ $BRIGHTNESS_PERC -gt 40 ]] then
            brightnessctl set 15%-
        elif [[ $BRIGHTNESS_PERC -gt 10 ]] then
            brightnessctl set 10%-
        else
            brightnessctl set $(($(brightnessctl get)/2+1))
        fi
        ;;
    *)
        echo "Unknown command $CMD for brightness change" 2>&1
        exit 1
        ;;
esac

# Recompute percentage
BRIGHTNESS_VAL=$(brightnessctl get)
BRIGHTNESS_PERC=$(bc -l <<< "(l(1+499*$BRIGHTNESS_VAL/$BRIGHTNESS_MAX)/l(500))*100" \
                    | xargs printf "%.0f")
echo $BRIGHTNESS_PERC

NOTIFY_ID=99299
NOTIFY_CMD="notify-send -c icon_progress -r $NOTIFY_ID"

# Send notification
${NOTIFY_CMD} -c drop_down -i $ICON -h int:value:"${BRIGHTNESS_PERC}%" " Brightness" ""
exit 0;
