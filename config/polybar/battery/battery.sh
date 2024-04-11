
POWER_MODE="$(cat /sys/firmware/acpi/platform_profile)"
ETA="$(acpi | grep -oE '[0-9]+:[0-9]+:[0-9]+.*')"
PERCENTAGE="$(acpi | grep -oE '[0-9]+%')"


ICON_PERFORMANCE="${HOME}/.config/polybar/battery/flame.png"
ICON_LOWPOWER="${HOME}/.config/polybar/battery/leaves.png"
ICON_BALANCED="${HOME}/.config/polybar/battery/flame-leaf.png"


NOTIFY_CMD="notify-send -c drop_down -r 99199"
MSG="<u>$POWER_MODE</u>\n$ETA\n"



case "$POWER_MODE" in
    performance)
        ${NOTIFY_CMD} -i "$ICON_PERFORMANCE" "Power Mode" "$MSG"
        ;;
    balanced)
        ${NOTIFY_CMD} -i "$ICON_BALANCED" "Power Mode" "$MSG"
        ;;
    low-power)
        ${NOTIFY_CMD} -i "$ICON_LOWPOWER" "Power Mode" "$MSG"
        ;;
    *)
        ${NOTIFY_CMD} -i battery-good "$MSG"
        ;;
esac
exit 0
