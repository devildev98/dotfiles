"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs
set pumheight=10                " Makes Popup smaller
set conceallevel=0              " Show `` in Markdown
set ruler
set background=dark
let g:rehsh256 = 1
let mapleader = " "
au! BufWritePost $MYVIMRC source %  "auto source when writting init.vim
set mouse=nicr
let g:python_highlight_all = 1
let g:python3_host_prog=expand("/usr/bin/python3")

