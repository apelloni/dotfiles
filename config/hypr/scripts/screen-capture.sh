#~/bin/bash

# Capture region of the screen using grim and slurp
grim -g "`slurp`" - | wl-copy --type image/png \
    && wl-paste > ~/Pictures/screenshot_`date +%Y%m%d_%H%M%S`.png \
    && notify-send -i clipboard "Screen Shot" "Area captured and saved in clipboard\n screenshot-`date +%Y%m%d_%H%M%S`.png"
