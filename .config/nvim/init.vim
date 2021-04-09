" ~/.config/nvim/init.vim
"
"    >=>                            >=>     >=>                       
"    >=>                        >>  >=>     >=>                       
"    >=>   >==>    >=>     >=>      >=>     >=>   >==>    >=>     >=> 
"  >=>>=> >>   >=>   >=>   >=>  >=>  >=>  >=>>=> >>   >=>   >=>   >=>  
" >>  >=> >>===>>=>   >=> >=>   >=>  >=> >>  >=> >>===>>=>   >=> >=>   
" >>  >=> >>           >=>=>    >=>  >=> >>  >=> >>           >=>=>    
"  >=>>=>  >====>       >=>     >=> >==>  >=>>=>  >====>       >=>     
"
set nocompatible              " be iMproved, required
filetype off                  " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Plug For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include vim-plug and initialize
call plug#begin('~/.config/nvim/plugged')

Plug 'itchyny/lightline.vim'                       " Lightline statusbar
Plug 'mengelbrecht/lightline-bufferline'           " Lightline Buffer list
Plug 'preservim/nerdtree',{'on': 'NERDTreeToggle'} " nerd tree file view
Plug 'mhinz/vim-startify'                          " startify
Plug 'jiangmiao/auto-pairs'                        " Auto-Pairs
Plug 'tpope/vim-commentary'                        " Commentary
Plug 'tpope/vim-fugitive'                          " Git Integration

call plug#end()            " required
" Brief help
" :PlugInstall - Installs plugins
" :PlugUpdate - Install or update plugins
" :PlugUpgrade - Upgrade cim plug
" :PlugClean[!] - confirms removal of unused plugins; append `!` to auto-approve removal
" :PlugStatus - Check status of plugins
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.config/nvim/plugin/nerdtree.vim
source ~/.config/nvim/plugin/lightline.vim
source ~/.config/nvim/plugin/startify.vim
source ~/.config/nvim/plugin/color_theme.vim
source ~/.config/nvim/plugin/general.vim
source ~/.config/nvim/plugin/remaps.vim
source ~/.config/nvim/plugin/coderunner.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au! BufRead,BufNewFile *.md setlocal spell
au BufEnter *.org            call org#SetOrgFileType()
