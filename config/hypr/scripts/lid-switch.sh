externalMonitor=( $(hyprctl monitors | grep -Eo 'Monitor (DP|HDMI)-[^ ]*' | sed 's/Monitor //') )
laptopMonitor=$(hyprctl monitors | grep -Eo 'Monitor eDP-1' | sed 's/Monitor //')

# Check that there is only one monitor attached
if [[ ${#externalMonitor[@]} -ne 1 ]]; then
    echo "Function enabled only for one external monitor active"
    # activate laptop monitor lid is open
    [[ "$1" == "on" ]] && [[ -z $laptopMonitor ]] && hyprctl keyword monitor "eDP-1, enable"
    exit 1
fi


# Switch laptop monitor status
if [[ ! -z $externalMonitor ]]; then
    if [ $# -ne 1 ]; then
        echo "command takes one argumnt: [on,off]"
        exit 1
    fi
    case $1 in
        "on")
            [[ -z $laptopMonitor ]] && hyprctl keyword monitor "eDP-1, enable"
            break;;
        "off")
            [[ ! -z $laptopMonitor ]] && hyprctl keyword monitor "$laptopMonitor, disable"
            break;;
        *)
            echo "command takes one argument: [on,off]"
            exit 1
    esac
fi
exit 0
