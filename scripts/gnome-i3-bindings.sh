#!/bin/bash

gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 10

# We are going to map switch-to-workspace-# to <Super-#>
# These key binding are already used, as can be seen by running
# gsettings list-recursively | egrep "<Super>[0-9]"
#
# We then need to unset all the switch-to-application-#

gsettings set org.gnome.shell.keybindings switch-to-application-1  []
gsettings set org.gnome.shell.keybindings switch-to-application-2  []
gsettings set org.gnome.shell.keybindings switch-to-application-3  []
gsettings set org.gnome.shell.keybindings switch-to-application-4  []
gsettings set org.gnome.shell.keybindings switch-to-application-5  []
gsettings set org.gnome.shell.keybindings switch-to-application-6  []
gsettings set org.gnome.shell.keybindings switch-to-application-7  []
gsettings set org.gnome.shell.keybindings switch-to-application-8  []
gsettings set org.gnome.shell.keybindings switch-to-application-9  []

# Rebind them to switch between workspaces on Win + number:

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1  "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2  "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3  "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4  "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5  "['<Super>5']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6  "['<Super>6']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7  "['<Super>7']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8  "['<Super>8']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9  "['<Super>9']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"

# In addition, it's convenient to have Win + Shift + number move a window between workspaces:

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1  "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2  "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3  "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4  "['<Super><Shift>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5  "['<Super><Shift>5']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6  "['<Super><Shift>6']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-7  "['<Super><Shift>7']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-8  "['<Super><Shift>8']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-9  "['<Super><Shift>9']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Super><Shift>0']"


# pop-shell 

# Move between windows
gsettings set org.gnome.shell.extensions.pop-shell focus-up "['<Ctrl>Up']"
gsettings set org.gnome.shell.extensions.pop-shell focus-down "['<Ctrl>Down']"
gsettings set org.gnome.shell.extensions.pop-shell focus-left "['<Ctrl>Left']"
gsettings set org.gnome.shell.extensions.pop-shell focus-right "['<Ctrl>Right']"

# Close window
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>F4', '<Super>Q']"

# Launcher to work also with keymap de_CH-latin1
gsettings set org.gnome.shell.extensions.pop-shell activate-launcher "['<Super>slash', '<Super>minus']"

# Auto start applications that have problems with AutoMoveWindow extension
# needs wmctrl to work (workspaces start from 0)

lanch_to_workspace(){
    exec=$1
    window_name=$2
    workspace_number=$(($3-1))  
    
    id=$(wmctrl -l | grep $window_name | awk '{print $1}')
    [[ ! -z $id ]] && return # skip if window is already running

    unset id
    counter=0; # in order to kill the loop after 2 seconds
    $exec &
    while [[ -z $id ]] && [[ $counter -lt 20 ]]; do 
        sleep 0.1
        id=$(wmctrl -l | grep $window_name | awk '{print $1}')
        counter=$((counter+1))
    done
    wmctrl -i -r $id -t $workspace_number # move to workspace
}

# Using [] we false positive
lanch_to_workspace "firefox" "[Ff]irefox" 1
lanch_to_workspace "evolution" "[Ee]volution" 5
lanch_to_workspace "slack" "[Ss]lack" 8
lanch_to_workspace "zulip" "[Zz]ulip" 9
lanch_to_workspace "gtk-launch kittytailing" "[b]tm" 10

#wmctrl -s 0
