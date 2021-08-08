#!/bin/sh

[[ -f ~/.xprofile ]] && . ~/.xprofile
exec $HOME/.local/bin/dwm
# exec dwm
# exec spectrwm
