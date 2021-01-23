#!/bin/sh
nitrogen --restore --random &
picom --experimental-backends --config ~/.config/picom/picom.conf &
~/.config/polybar/launch.sh $
