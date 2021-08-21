"Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=30
let g:NERDTreeWinPos = 'right'
let g:NERDTreeChDirMode=get(g:,'NERDTreeChDirMode',1)
