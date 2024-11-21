#
#$before-sleep-command = 'loginctl lock-session $XDG_SESSION_ID'
#$lock-command = 'playerctl -a pause; swaylock --config ~/.config/sway/swaylock.conf'
#$lock-command = '/usr/bin/swaylock --config ~/.config/sway/swaylock.conf'
BEFORE_CMD='loginctl lock-session $XDG_SESSION_ID'
LOCK_CMD='swaylock --config ~/.config/sway/swaylock.conf'
#exec = swayidle -w before-sleep "$before-sleep-command" lock "$lock-command"
swayidle -w before-sleep "${BEFORE_CMD}" \
                    lock "${LOCK_CMD}" &
