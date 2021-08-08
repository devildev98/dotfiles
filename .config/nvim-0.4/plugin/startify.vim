"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:asciiart =
          \['  _    _    _    _    _    _    _    _  ',
          \' / \  / \  / \  / \  / \  / \  / \  / \ ',
          \'( D )( E )( V )( I )( L )( D )( E )( V )',
          \' \_/  \_/  \_/  \_/  \_/  \_/  \_/  \_/ ',
          \ ' ']

let g:startify_custom_header = map(s:asciiart + 
                                   \ startify#fortune#quote(), '"   ".v:val')
let g:startify_custom_footer =
           \ ['', "   Vim is charityware. Please read ':help uganda'.", '']
let g:startify_list_order = [
      \ ['   My most recently used files in the current directory:'],
      \ 'dir',
      \ ['   My most recently used files:'],
      \ 'files',
      \ ['   These are my sessions:'],
      \ 'sessions',
      \ ['   These are my bookmarks:'],
      \ 'bookmarks',
      \ ]
let g:startify_bookmarks = [
			\{'v': '~/.config/nvim/init.vim'},
			\{'f': '~/.config/fish/config.fish'}, 
			\{'t': '~/.config/alacritty/alacritty.conf'}
			\]
" vim:set et sw=2:
