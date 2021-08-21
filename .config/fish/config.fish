# ~/.config/fish/config.fish
#
#    >=>                            >=>     >=>
#    >=>                        >>  >=>     >=>
#    >=>   >==>    >=>     >=>      >=>     >=>   >==>    >=>     >=>
#  >=>>=> >>   >=>   >=>   >=>  >=>  >=>  >=>>=> >>   >=>   >=>   >=>
# >>  >=> >>===>>=>   >=> >=>   >=>  >=> >>  >=> >>===>>=>   >=> >=>
# >>  >=> >>           >=>=>    >=>  >=> >>  >=> >>           >=>=>
#  >=>>=>  >====>       >=>     >=> >==>  >=>>=>  >====>       >=>
#

fish_vi_key_bindings
# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set EDITOR "nvim"

## Environment setup
# Apply .profile
# source ~/.profile

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Replace cat with bat
abbr cat 'bat --style header --style rules --style snip --style changes --style header'

# yay and paru
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'


## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

function fish_user_key_bindings
    bind ! bind_bang
end


## Starship prompt
if status --is-interactive
   # source (starship init fish --print-full-init | psub)
   source (zoxide init fish | psub)
end

### pfetch ###
# if status --is-interactive
#    pfetch #|lolcat
# end


if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

### RANDOM COLOR SCRIPT ###
colorscript random

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan


# Changing "ls" to "exa"
alias ls='exa -a' # my preferred listing
alias la='exa -al --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
abbr l. "exa -a | egrep '^\.'"                                     # show only dotfiles

# Directory Traversal
alias ..= 'cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Colorize grep output (good for log files)
abbr grep 'grep --color=auto'
abbr egrep 'egrep --color=auto'
abbr fgrep 'fgrep --color=auto'
abbr v 'nvim'

# confirm before overwriting something
abbr cp "cp -i"
abbr mv 'mv -i'
abbr rm 'rm -i'

# adding flags
abbr df 'df -h'                          # human-readable sizes
abbr free 'free -m'                      # show sizes in MB
# Python abbr
abbr py 'python3'

# config files
abbr fishconf 'nvim ~/.config/fish/config.fish'
abbr kittyconf 'nvim ~/.config/kitty/kitty.conf'
abbr vimconf 'nvim ~/.config/nvim/init.vim'

# youtube-dl abbr
abbr ytm 'youtube-dl -x --audio-format mp3 --audio-quality 320k  -o "~/Music/%(title)s.%(ext)s"'
abbr ytmdl 'ytmdl --ignore-errors'
abbr mpv 'devour mpv'
abbr ytdl 'youtube-dl'

# Cleanup orphaned packages
abbr cleanup 'sudo pacman -Rns (pacman -Qtdq)'
