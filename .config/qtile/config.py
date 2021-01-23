#      _            _ _     _            
 #     | |          (_) |   | |           
 #   __| | _____   ___| | __| | _____   __
 #  / _` |/ _ \ \ / / | |/ _` |/ _ \ \ / /
 # | (_| |  __/\ V /| | | (_| |  __/\ V / 
 #  \__,_|\___| \_/ |_|_|\__,_|\___| \_/  
 #
 # 
# -*- coding: utf-8 -*-
import os
import re
import socket
import subprocess
from libqtile.config import KeyChord, Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import qtile
from libqtile import layout, bar, widget, hook
from libqtile.lazy import lazy
from typing import List  # noqa: F401
from libqtile.utils import guess_terminal
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.utils import guess_terminal

####### For qtile in gnome ##########
@hook.subscribe.startup
def dbus_register():
    id = os.environ.get('DESKTOP_AUTOSTART_ID')
    if not id:
        return
    subprocess.Popen(['dbus-send',
                      '--session',
                      '--print-reply',
                      '--dest=org.gnome.SessionManager',
                      '/org/gnome/SessionManager',
                      'org.gnome.SessionManager.RegisterClient',
                      'string:qtile',
                      'string:' + id])

###################################################################

mod = "mod4"
terminal = "alacritty"

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", 
    	lazy.layout.shuffle_left(),
        desc="Move window to the left"
        ),
    Key([mod, "shift"], "l", 
    	lazy.layout.shuffle_right(),
        desc="Move window to the right"
        ),
    Key([mod, "shift"], "j", 
    	lazy.layout.shuffle_down(),
        desc="Move window down"
        ),
    Key([mod, "shift"], "k", 
    	lazy.layout.shuffle_up(), 
    	desc="Move window up"
    	),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", 
    	lazy.layout.grow_left(),
        desc="Grow window to the left"
        ),
    Key([mod, "control"], "l", 
    	lazy.layout.grow_right(),
        desc="Grow window to the right"
        ),
    Key(
    	[mod, "control"], "j", 
    	lazy.layout.grow_down(),
        desc="Grow window down"
        ),
    Key([mod, "control"], "k", 
    	lazy.layout.grow_up(), 
    	desc="Grow window up"
    	),
    Key([mod], "n", 
    	lazy.layout.normalize(), 
    	desc="Reset all window sizes"
    	),
    Key(
    	[mod, "shift"], 
    	"Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"
        ),
    Key(
    	[mod],"Return", 
    	lazy.spawn(terminal), 
    	desc="Launch terminal"
    	),
    # Toggle between different layouts as defined below
    Key(
    	[mod], "Tab", 
    	lazy.next_layout(), 
    	desc="Toggle between layouts"
    	),
    # Toggle top bar
    Key([mod,"shift"], "x", 
    	lazy.hide_show_bar("top"), 
    	desc='toggle top bar'
    	),
    # quit application
    Key(
    	[mod], "w",
    	lazy.window.kill(),
    	desc="Kill focused window"
    	),
    Key(
    	[mod, "control"], "q",
    	lazy.shutdown(), 
    	desc="Shutdown Qtile"),
    Key(
    	[mod, "control"], "r", 
    	lazy.restart(), 
    	desc="Restart Qtile"
    	),
    # open firefox
    Key(
       	[mod], "b", 
       	lazy.spawn("firefox"), 
       	desc="Open firefox",
    	),
    # open file manager
    Key(
        [mod], "f",
        lazy.spawn("nautilus"),
        desc ="open file manager",
         ),
    Key([mod], "r", 
    	lazy.spawn("rofi -show run"),
        desc="Spawn a command using a prompt widget"
        ),
]


group_names = [(" ", {'layout': 'monadtall'}),
               (" ", {'layout': 'monadtall'}),
               (" ", {'layout': 'monadtall'}),
               (" ", {'layout': 'monadtall'}),
               (" ", {'layout': 'monadtall'}),]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

layout_theme = {
				"border_width": 2,
                "margin": 6,
                "border_focus": "e1acff",
                "border_normal": "1D2330"
                }

layouts = [
    #layout.MonadWide(**layout_theme),
    #layout.Bsp(**layout_theme),
    #layout.Stack(stacks=2, **layout_theme),
    #layout.Columns(**layout_theme),
    #layout.RatioTile(**layout_theme),
    #layout.VerticalTile(**layout_theme),
    #layout.Matrix(**layout_theme),
    #layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Tile(shift_windows=True, **layout_theme),
    layout.Stack(num_stacks=2),
    layout.TreeTab(
         font = "UBUNTU",
         fontsize = 10,
         sections = ["FIRST", "SECOND"],
         section_fontsize = 11,
         bg_color = "141414",
         active_bgh = "90C435",
         active_fg = "000000",
         inactive_bg = "384323",
         inactive_fg = "a0a0a0",
         padding_y = 5,
         section_top = 10,
         panel_width = 320
         ),
    layout.Floating(**layout_theme)
]

########## color scheme #################################################
colors = [["#282c34", "#282c34"], # panel background
          ["#434758", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#8d62a9", "#8d62a9"], # border line color for other tab and odd widgets
          ["#668bd7", "#668bd7"], # color for the even widgets
          ["#e1acff", "#e1acff"]] # window name

# prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

####### Default Widget settings ################
widget_defaults = dict(
    font="Hack Nerd Font",
    fontsize = 12,
    padding = 2,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()

###### Mouse callbacks ##########
def shutdown():
	qtile.cmd_shutdown()
def mouse_rofi(): 
  qtile.cmd_spawn("rofi -show run")
def htop():
  qtile.cmd_spawn(terminal + ' -e htop')

def init_widgets_list():
    widgets_list = [
              widget.Sep(
                       linewidth = 0,
                       padding = 6,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.Image(
                       filename = "~/.config/qtile/icons/python.png",
                       padding= 7,
                       mouse_callbacks={'Button1': mouse_rofi},
                       ),
              widget.GroupBox(
                       font = "Ubuntu Bold",
                       fontsize = 20,
                       margin_y = 3,
                       margin_x = 10,
                       padding_y = 5,
                       padding_x = 3,
                       borderwidth = 3,
                       active = colors[2],
                       inactive = colors[2],
                       rounded = False,
                       highlight_color = colors[1],
                       highlight_method = "line",
                       this_current_screen_border = colors[3],
                       this_screen_border = colors [4],
                       other_current_screen_border = colors[0],
                       other_screen_border = colors[0],
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.Prompt(
                       font = "Ubuntu Mono",
                       padding = 10,
                       foreground = colors[3],
                       background = colors[1]
                       ),
              widget.Sep(
                       linewidth = 0,
                       padding = 40,
                       foreground = colors[2],
                       background = colors[0]
                       ),
              widget.WindowName(
                       foreground = colors[6],
                       background = colors[0],
                       padding = 0,
                       ),
              widget.TextBox(
                    text = '',
                    foreground = colors[5],
                    background = colors[0],
                    padding = -7,
                    fontsize= 50,
                    ),
              widget.TextBox(
                       text = " 🖬",
                       foreground = colors[2],
                       background = colors[5],
                       padding = 0,
                       fontsize = 14
                       ),
              widget.Memory(
                       foreground = colors[2],
                       background = colors[5],
                       mouse_callbacks = {'Button1': htop},
                       padding = 5
                       ),
              widget.TextBox(
                    text = '',
                    foreground = colors[4],
                    background = colors[5],
                    padding = -7,
                    fontsize= 50,
                    ),
              widget.TextBox(
                       text='',
                       background = colors[4],
                       foreground = colors[2],
                       padding = 7,
                       fontsize = 15
                       ),              
              widget.Net(
                       # interface = "enp6s0",
                       format = '{down}',
                       foreground = colors[2],
                       background = colors[4],
                       padding = 5
                       ),
              widget.TextBox(
                    text = '',
                    foreground = colors[5],
                    background = colors[4],
                    padding = -7,
                    fontsize= 50,
                    ),
              widget.TextBox(
		              	text = '',
		              	foreground = colors[2],
		              	background = colors[5],
		              	padding = 7,
		              	fontsize= 15,
		              	),
              widget.Volume(          
                       foreground = colors[2],
                       background = colors[5],
                       padding = 5,
                       ),
              widget.TextBox(
                    text = '',
                    foreground = colors[4],
                    background = colors[5],
                    padding = -7,
                    fontsize= 50,
                    ),
              widget.CurrentLayoutIcon(
                       custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                       foreground = colors[0],
                       background = colors[4],
                       padding = 0,
                       scale = 0.7
                       ),
              widget.CurrentLayout(
                       foreground = colors[2],
                       background = colors[4],
                       padding = 5
                       ),
              widget.TextBox(
                    text = '',
                    foreground = colors[5],
                    background = colors[4],
                    padding = -7,
                    fontsize= 50,
                    ),
              widget.Clock(
                       foreground = colors[2],
                       background = colors[5],
                       format = "%A   %d %b   %I:%M %p"
                       ),
              widget.TextBox(
                    text = '',
                    foreground = colors[4],
                    background = colors[5],
                    padding = -10,
                    fontsize= 50,
                    ),
              widget.TextBox(
		              	text = '',
		              	foreground = colors[2],
		              	background = colors[4],
		              	padding = 7,
		              	fontsize= 15,
		              	mouse_callbacks={'Button1': shutdown},
		              	),
              # widget.Sep(
              #          linewidth = 0,
              #          padding = 10,
              #          foreground = colors[0],
              #          background = colors[5]
              #          ),
              # widget.Systray(
              #          background = colors[0],
              #          padding = 5
              #          ),
              ]
    return widgets_list

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_list(), opacity=0.9,
      size=25))]


if __name__ in ["config", "__main__"]:
    screens = init_screens()
    # widgets_list = init_widgets_list()

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position()),

    Drag(
        [mod],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()),

    Click(
        [mod],
        "Button2",
        lazy.window.toggle_floating())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    Match(wm_type='utility'),
    Match(wm_type='notification'),
    Match(wm_type='toolbar'),
    Match(wm_type='splash'),
    Match(wm_type='dialog'),
    Match(wm_class='file_progress'),
    Match(wm_class='confirm'),
    Match(wm_class='dialog'),
    Match(wm_class='download'),
    Match(wm_class='error'),
    Match(wm_class='notification'),
    Match(wm_class='splash'),
    Match(wm_class='toolbar'),
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

@hook.subscribe.client_new
def floating_size_hints(window):
    hints = window.window.get_wm_normal_hints()
    if hints and 0 < hints['max_width'] < 1000:
        window.floating = True


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

