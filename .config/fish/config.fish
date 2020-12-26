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
### SETTING THE STARSHIP PROMPT ###
starship init fish | source

### EXPORT ###
set fish_greeting                      # Supresses fish's intro message


### RANDOM COLOR SCRIPT ###
colorscript random

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

# Changing "ls" to "exa"
alias la = 'ls -A' # for all dot files except . & .. files
alias ll = 'ls -l' # for long form
#alias ls='exa -al --color=always --group-directories-first' # my preferred listing
#alias la='exa -a --color=always --group-directories-first'  # all files and dirs
#alias ll='exa -l --color=always --group-directories-first'  # long format
#alias lt='exa -aT --color=always --group-directories-first' # tree listing

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB


