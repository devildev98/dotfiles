# vim: ft=cfg
PATH=$HOME/.local:$PATH
PATH=$HOME/.local/bin:$PATH
xrandr -s 1920x1080
# $HOME/.local/bin/setwall &
nitrogen --restore &
thunar --daemon &
mpd > /dev/null 2>&1 &
picom > /dev/null 2>&1 &
dunst > /dev/null 2>&1 &
slstatus &
exec $HOME/.local/bin/dwm
# exec dwm
