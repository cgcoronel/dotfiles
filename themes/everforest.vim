if has('termguicolors')
 set termguicolors
endif

" For dark version.
set background=dark

let g:everforest_background = 'hard'

colorscheme everforest



""""""" Custom colors
hi SignColumn ctermbg=235 guifg=#d3c6aa guibg=#2b3339
hi GreenSign ctermfg=142 ctermbg=235 guifg=#a7c080 guibg=#2b3339"
hi BlueSign ctermfg=109 ctermbg=235 guifg=#7fbbb3 guibg=#2b3339
hi RedSign ctermfg=167 ctermbg=235 guifg=#e67e80 guibg=#2b3339


"""""" "Status bar
hi StatusLine    ctermfg=245 ctermbg=236 guifg=#868d80 guibg=#323c41
hi StatusLineNC  ctermfg=245 ctermbg=236 guifg=#868d80 guibg=#323c42

"""""" "highlighting TODO
hi Todo cterm=bold ctermfg=234 ctermbg=167 gui=bold guifg=#1d2021 guibg=#fb4934

"require()
hi PurpleItalic ctermfg=175 guifg=#d699b6 cterm=italic gui=italic 

"Visual color selection
hi Visual ctermbg=52 guibg=#503946

"""""" "hide buffer line ~
hi EndOfBuffer ctermfg=234 ctermbg=239 guifg=#2b3339 guibg=#2b3339

"""""" Color selection in visual mode
hi Visual ctermbg=52 guibg=#5f5c5c
