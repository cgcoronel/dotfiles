"""""""""""""" Config params
if has('termguicolors')
    set termguicolors
endif

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'

colorscheme gruvbox-material

" For dark version.
set background=dark

"""""""""""""" Custom colors
hi SignColumn ctermbg=234 guibg=#282828
hi GitGutterAdd ctermfg=143 ctermbg=234 guifg=#b8bb26 guibg=#282828
hi GitGutterChange ctermfg=108 ctermbg=234 guifg=#8ec07c guibg=#282828
hi GitGutterDelete ctermfg=167 ctermbg=234 guifg=#fb4934 guibg=#282828
hi GitGutterChangeDelete ctermfg=108 ctermbg=234 guifg=#8ec07c guibg=#282828

hi StatusLine ctermfg=245 ctermbg=236 guifg=#928375 guibg=#32302f
