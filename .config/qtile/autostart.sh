#!/bin/sh
nitrogen --restore &
picom --experimental-backends --config ~/.config/picom/picom.conf &
~/.config/polybar/launch.sh $
