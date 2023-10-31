#!/bin/bash
# This script uses depends on
#  - pulseaudio-ctl
#  - dracula-icons-git
#  - dunst

# Execute pulseaudio command
CMD="$1"
pulseaudio-ctl $CMD

FULL_STATUS=($(pulseaudio-ctl full-status))

VOLUME=${FULL_STATUS[0]}
SINK_MUTE=${FULL_STATUS[1]}
SOURCE_MUTE=${FULL_STATUS[2]}


NOTIFY_ID=99299
NOTIFY_CMD="notify-send -c icon_progress -r $NOTIFY_ID"
echo $VOLUME
case "$CMD" in
    up|down)
        ICON=audio-volume-high
        [[ $VOLUME -le 60 ]] && ICON=audio-volume-medium
        [[ $VOLUME -le 30 ]] && ICON=audio-volume-low
        ${NOTIFY_CMD} -i $ICON -h int:value:"${VOLUME}%" "Volume" ""
        ;;
    mute)
        if [[ "$SINK_MUTE" == "yes" ]] then
            ICON=audio-volume-off
            ${NOTIFY_CMD} -c drop_down -i $ICON "Audio Off" ""
        else
            ICON=audio-on
            ${NOTIFY_CMD} -c drop_down -i $ICON "Audio On" ""
        fi
        ;;
    mute-input)
        if [[ "$SOURCE_MUTE" == "yes" ]] then
            ICON=mic-off
            ${NOTIFY_CMD} -c drop_down -i $ICON "Mute" ""
        else
            ICON=mic-on
            ${NOTIFY_CMD} -c drop_down -i $ICON "Un-Mute" ""
        fi
         ;;
    *)
        echo "Unknown command $CMD for pulseaudio-ctrl" 2>&1
        exit 1
        ;;
esac
exit 0;
