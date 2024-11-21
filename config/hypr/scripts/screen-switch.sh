externalMonitor=( $(hyprctl monitors | grep -Eo 'Monitor (DP|HDMI)-[^ ]*' | sed 's/Monitor //') )
laptopMonitor=$(hyprctl monitors | grep -Eo 'Monitor eDP-1' | sed 's/Monitor //')

# Check that there is only one monitor attached
if [[ ${#externalMonitor[@]} -ne 1 ]]; then
    echo "Function enabled only for one external monitor active"
    # activate laptop monitor if pressing the button
    [[ -z $laptopMonitor ]] && hyprctl keyword monitor "eDP-1, enable"
    exit 1
fi


# Change laptop monitor status in a cyclic way
if [[ ! -z $externalMonitor ]]; then
    # mirror
    #[[ -z $laptopMonitor ]] && hyprctl keyword monitor "eDP-1,preferred,auto,1,mirror,$externalMonitor"
    if [[ -z $laptopMonitor ]]; then
        hyprctl keyword monitor "eDP-1, enable"
    else
        hyprctl keyword monitor "$laptopMonitor, disable"
    fi
fi
exit 0
