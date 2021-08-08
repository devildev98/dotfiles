#!/bin/sh
# Load programs
xrandr -s 1920x1080
nitrogen --restore &
slstatus &
mpd > /dev/null 2>&1 &
picom > /dev/null 2>&1 &
dunst > /dev/null 2>&1 &
thunar --daemon &
