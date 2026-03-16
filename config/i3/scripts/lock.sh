#!/bin/bash

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#babbf155'
TEXT='#c6d0f5'
WRONG='#ea999c'
VERIFYING='#8caaee'

i3lock-color \
    --nofork \
    \
    --insidever-color=$CLEAR \
    --ringver-color=$VERIFYING \
    \
    --insidewrong-color=$CLEAR \
    --ringwrong-color=$WRONG \
    \
    --inside-color=$BLANK \
    --ring-color=$DEFAULT \
    --line-color=$BLANK \
    --separator-color=$DEFAULT \
    \
    --radius=150.0 \
    --ring-width=20.0 \
    \
    --verif-color=$TEXT \
    --wrong-color=$TEXT \
    --time-color=$TEXT \
    --date-color=$TEXT \
    --layout-color=$TEXT \
    --keyhl-color=$WRONG \
    --bshl-color=$WRONG \
    \
    --image="/home/apelloni/Pictures/2015-KLIMT-04-FEAT.jpg" \
    --fill \
    \
    --clock \
    --indicator \
    --time-str="%H:%M:%S" \
    --date-str="" \
    --keylayout 2 \
    \
    --layout-size=20 \
    --{time,date,layout,verif,wrong,greeter}-font=sans-serif:bold \
    --{time,date,verif,wrong,greeter}-size=50 \
    --{time,date,layout,verif,wrong,greeter,modifier}outline-width=1 \
    --{time,date,layout,verif,wrong,greeter,modif}outline-color=#00000033
