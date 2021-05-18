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


function bind_bang
    switch (commandline --current-token)[-1]
    case "!"
        # Without the `--`, the functionality can break when completing
        # flags used in the history (since, in certain edge cases
        # `commandline` will assume that *it* should try to interpret
        # the flag)
        commandline --current-token -- $history[1]
        commandline --function repaint
    case "*"
        commandline --insert !
    end
end

function fish_user_key_bindings
    bind ! bind_bang
end

### SETTING THE STARSHIP PROMPT ###
starship init fish | source

### pfetch ###
pfetch | lolcat
# alacritty-pywal &

### EXPORT ###
set fish_greeting                      # Supresses fish's intro message


### RANDOM COLOR SCRIPT ###
#colorscript random

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### DEv ###
#bind \cl 'echo -n (clear | string replace \e[3J] ""); commandline -f repaint'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# Directory Traversal
alias ..= 'cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias v='nvim'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
# Python alias
alias py='python3'

# config files
alias fishconf='nvim ~/.config/fish/config.fish'
alias kittyconf='nvim ~/.config/kitty/kitty.conf'
alias vimconf='nvim ~/.config/nvim/init.vim'

# youtube-dl alias
alias ytm='youtube-dl -x --audio-format mp3 --audio-quality 320k  -o "~/Music/%(title)s.%(ext)s"'
alias ytmdl='ytmdl --ignore-errors'
alias mpv='devour mpv'
alias ytdl='youtube-dl'
