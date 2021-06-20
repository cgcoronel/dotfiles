hi PmenuThumb gui=bold ctermfg=124 ctermfg=black
hi ModeMsg gui=none ctermfg=124 ctermfg=white 
hi LineNr ctermfg=237 guifg=#3c3836

"Code Comments
hi Comment cterm=italic ctermfg=241 gui=italic guifg=#928374
hi Normal ctermfg=15 guifg=#928374

"Coc suggestion box
hi Pmenu ctermfg=223 ctermbg=236 guifg=bg guibg=#504945
hi PmenuSel ctermfg=234 ctermbg=241 gui=bold guifg=#1d2021 guibg=#fb4934

"notifications simbols in status vertical bar
hi GitGutterAdd ctermfg=143 ctermbg=234 guifg=#b8bb26 guibg=#3c3836
hi GitGutterChange ctermfg=108 ctermbg=234 guifg=#8ec07c guibg=#3c3836
hi GitGutterDelete ctermfg=167 ctermbg=234 guifg=#fb4934 guibg=#3c3836 
hi GitGutterChangeDelete ctermfg=108 ctermbg=234 guifg=#8ec07c guibg=#3c3836

hi CocErrorSign ctermfg=167 ctermbg=234 guifg=#b8bb26 guibg=#3c3836
hi CocWarningSign ctermfg=179 ctermbg=234 guifg=#b8bb26 guibg=#3c3836
hi CocInfoSign ctermfg=179 ctermbg=234 guifg=#b8bb26 guibg=#3c3836
hi CocHintSign ctermfg=109 ctermbg=234 guifg=#b8bb26 guibg=#3c3836

hi SignColumn ctermbg=234 guibg=#3c3836

hi Folded cterm=italic ctermfg=245 ctermbg=235 gui=italic guifg=#928374 guibg=#3c3836
hi FoldColumn ctermfg=245 ctermbg=235 guifg=#928374 guibg=#3c3836

"NerdTree
hi NERDTreeDir gui=bold ctermfg=243 guifg=#7c6f64
hi NERDTreeDirSlash gui=bold ctermfg=243 guifg=#7c6f64

"NerdTree Arrows red 167
hi NERDTreeOpenable ctermfg=241
hi NERDTreeClosable ctermfg=241

"NerdTree file directory name
hi NERDTreeCWD gui=bold ctermfg=241 

"Status bar
hi StatusLine ctermfg=235 ctermbg=241 
hi StatusLineNC ctermfg=235 ctermbg=241 
hi StatusBar ctermfg=240 guifg=#fb4934 ctermbg=235

"Mode color
hi ModeMsg ctermfg=243
hi MsgArea ctermfg=243

"""""hi GruvboxYellowBold cterm=bold ctermfg=243 gui=bold guifg=#fabd2f

"Cursor line
hi CursorLine ctermbg=235 guibg=#3c3836
hi CursorLineNr ctermfg=15 ctermbg=235 guifg=#fabd2f guibg=#3c3836

hi Ignore ctermfg=241 guifg=bg

hi String ctermfg=144 guifg=#b8bb26

"highlighting TODO
hi Todo cterm=bold ctermfg=234 ctermbg=167 gui=bold guifg=#1d2021 guibg=#fb4934

"General color text
hi Pmenu ctermfg=15

hi htmlBold ctermfg=15 
hi htmlBoldUnderline ctermfg=15
hi htmlBoldItalic ctermfg=15
hi htmlBoldUnderlineItalic ctermfg=15
hi htmlUnderline ctermfg=15
hi htmlUnderlineItalic ctermfg=15
hi htmlItalic ctermfg=15

"require()
hi jsGlobalNodeObjects cterm=italic gui=italic ctermfg=14 guifg=#fe8019

"Visual color selection
hi clear Visual 
hi Visual ctermbg=239 ctermfg=NONE

" Fzfj
hi fzf1 ctermfg=241 ctermbg=235 guifg=#E12672 guibg=#565656
hi fzf2 ctermfg=241 ctermbg=235 guifg=#E12672 guibg=#565656 cterm=bold 
hi fzf3 ctermfg=241 ctermbg=235 guifg=#E12672 guibg=#565656

" Search 
hi Search cterm=reverse ctermfg=179 ctermbg=234 gui=reverse guifg=#fabd2f guibg=#1d2021

"hide buffer line ~
hi EndOfBuffer ctermfg=234 ctermbg=234

"vim fugitive diff
hi DiffAdd cterm=reverse ctermfg=10 ctermbg=234 gui=reverse guifg=#b8bb26 guibg=#1d2021
hi DiffText cterm=reverse ctermfg=179 ctermbg=234 gui=reverse guifg=#fabd2f guibg=#1d2021

"""""
hi SpecialKey ctermfg=12
hi Type ctermfg=12 gui=bold cterm=italic
hi CursorLine ctermbg=235 guibg=#3c3836 cterm=NONE
hi Title ctermfg=11 
hi Statement ctermfg=12 gui=bold guifg=#ffff60
hi Constant ctermfg=15
hi Number  ctermfg=13
hi jsOperator ctermfg=15
hi Operator ctermfg=15
hi Function cterm=bold ctermfg=10
hi DiffDelete cterm=reverse ctermfg=167 ctermbg=234 gui=reverse guifg=#fb4934 guibg=#1d2021
hi IncSearch cterm=reverse ctermfg=208 ctermbg=234 gui=reverse guifg=#fe8019 guibg=#1d2021
hi VertSplit ctermfg=235 ctermbg=235
