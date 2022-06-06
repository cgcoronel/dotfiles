hi Folded cterm=italic ctermfg=245 ctermbg=8 gui=italic guifg=#928374 guibg=#3c3836
hi FoldColumn ctermfg=0 ctermbg=0
hi Comment cterm=italic ctermfg=241 gui=italic guifg=#928374

"Coc suggestion box
hi Pmenu ctermfg=7 ctermbg=8 guifg=bg guibg=#504945
hi PmenuSel ctermfg=7 ctermbg=241 gui=bold guifg=#1d2021 guibg=#fb4934

"notifications simbols in status vertical bar
hi GitGutterAdd ctermfg=8 ctermbg=0 guifg=#b8bb26 guibg=#3c3836
hi GitGutterChange ctermfg=8 ctermbg=0 guifg=#8ec07c guibg=#3c3836
hi GitGutterDelete ctermfg=8 ctermbg=0 guifg=#fb4934 guibg=#3c3836 
hi GitGutterChangeDelete ctermfg=8 ctermbg=0 guifg=#8ec07c guibg=#3c3836

hi SignColumn ctermbg=0 guibg=#3c3836

"Status bar
hi StatusLine cterm=NONE ctermfg=243 ctermbg=15
hi StatusLineNC cterm=NONE ctermfg=243 ctermbg=15

"Mode color
hi MsgArea ctermfg=243

"Cursor line
hi CursorLine ctermbg=NONE guibg=#3c3836 cterm=NONE
hi CursorLineNr cterm=none ctermfg=244 ctermbg=NONE guifg=#fabd2f guibg=#3c3836
hi LineNr ctermfg=8 guifg=#3c3836

hi Ignore cterm=bold ctermfg=241 guifg=bg

"highlighting TODO
hi Todo cterm=bold ctermfg=0 ctermbg=167 gui=bold guifg=#1d2021 guibg=#fb4934

"Visual color selection
hi clear Visual 
hi Visual ctermbg=8 ctermfg=NONE

" Search 
hi Search cterm=reverse ctermfg=179 ctermbg=0 gui=reverse guifg=#fabd2f guibg=#1d2021

""hi Title ctermfg=11 
hi VertSplit ctermfg=0 ctermbg=8

"git diff
hi DiffAdd cterm=reverse ctermfg=10 ctermbg=0 gui=reverse guifg=#b8bb26 guibg=#1d2021
hi DiffText cterm=reverse ctermfg=179 ctermbg=0 gui=reverse guifg=#fabd2f guibg=#1d2021
hi DiffChange cterm=reverse ctermfg=108 ctermbg=0 gui=reverse guifg=#8ec07c guibg=#1d2021
hi DiffDelete term=bold cterm=bold ctermfg=4 ctermbg=0 gui=bold guifg=LightBlue guibg=#f6e8d0

hi MatchParen ctermbg=14 ctermfg=0
