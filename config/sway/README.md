 - volume controlled by `pulseautio-ctl`
 - brightness controlled by `brightnessctl`
 - app launcher `rofi` with themes from `https://github.com/adi1090x/rofi`
 - theme with `lxappearance`
 - background picture with `feh`
 - allow transparency with `picom`

 For natural scrolling add to `/usr/share/X11/xorg.conf.d/40-libinput.conf`

 ```
 Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
EndSection
```


