hi PmenuThumb gui=bold ctermfg=124 ctermfg=black
hi GruvboxGreenBold gui=none ctermfg=124 ctermfg=green
hi ModeMsg gui=none ctermfg=124 ctermfg=white 
"hi MsgArea gui=none ctermfg=124 ctermfg=white 
hi LineNr ctermfg=237 guifg=#3c3836

"Code Comments
hi Comment cterm=italic ctermfg=241 gui=italic guifg=#928374
"hi Normal ctermfg=245 guifg=#928374
hi Normal ctermfg=15 guifg=#928374

"Coc suggestion box
hi Pmenu ctermfg=223 ctermbg=236 guifg=bg guibg=#504945
"hi PmenuSel cterm=bold ctermfg=234 ctermbg=241 gui=bold guifg=#1d2021 guibg=#fb4934 "red
hi PmenuSel cterm=bold ctermfg=234 ctermbg=241 gui=bold guifg=#1d2021 guibg=#fb4934

"notifications simbols in status vertical bar
hi GitGutterAdd ctermfg=142 ctermbg=234 guifg=#b8bb26 guibg=#3c3836
hi GitGutterChange ctermfg=108 ctermbg=234 guifg=#8ec07c guibg=#3c3836
hi GitGutterDelete ctermfg=167 ctermbg=234 guifg=#fb4934 guibg=#3c3836 
hi GitGutterChangeDelete ctermfg=108 ctermbg=234 guifg=#8ec07c guibg=#3c3836

hi CocErrorSign ctermfg=167 ctermbg=234 guifg=#b8bb26 guibg=#3c3836
hi CocWarningSign ctermfg=208 ctermbg=234 guifg=#b8bb26 guibg=#3c3836
hi CocInfoSign ctermfg=214 ctermbg=234 guifg=#b8bb26 guibg=#3c3836
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
hi StatusLine ctermfg=235 ctermbg=235 
hi StatusLineNC ctermfg=235 ctermbg=235 
""hi StatusBar ctermfg=167 guifg=#fb4934 ctermbg=235
hi StatusBar ctermfg=241 guifg=#fb4934 ctermbg=235
"hi StatusBar ctermfg=214 guifg=#fb4934 ctermbg=235 

"Split bar
"hi VertSplit ctermfg=235 ctermbg=235
hi VertSplit ctermfg=235 ctermbg=234

"Mode color
hi ModeMsg ctermfg=243
hi MsgArea ctermfg=243

hi GruvboxYellowBold cterm=bold ctermfg=243 gui=bold guifg=#fabd2f

"Cursor line
hi CursorLine ctermbg=235 guibg=#3c3836
hi CursorLineNr ctermfg=15 ctermbg=235 guifg=#fabd2f guibg=#3c3836

hi Ignore ctermfg=241 guifg=bg

"Global text
"hi Question ctermfg=121 gui=bold guifg=Green
"hi GruvboxOrange cterm=italic gui=italic ctermfg=209 guifg=#fe8019

" Naranja
"hi GruvboxOrange cterm=italic gui=italic ctermfg=215 guifg=#fe8019
"hi GruvboxOrangeBold cterm=bold ctermfg=209 gui=bold guifg=#fe8019
" Celeste
hi GruvboxOrange cterm=italic gui=italic ctermfg=4 guifg=#fe8019
hi GruvboxOrangeBold cterm=bold ctermfg=4 gui=bold guifg=#fe8019

hi GruvboxYellow ctermfg=179 guifg=#fabd2f
hi String ctermfg=144 guifg=#b8bb26



"highlighting console.log
"match console '^.*console.*'
"autocmd VimEnter,WinEnter * 2match ErrorMsg '^.*console.*' 

"highlighting TODO
hi Todo cterm=bold ctermfg=234 ctermbg=167 gui=bold guifg=#1d2021 guibg=#fb4934

"General color text
hi Pmenu ctermfg=180
"hi Normal ctermfg=180
hi GruvboxFg2 ctermfg=180
"hi Todo ctermfg=180
"hi GruvboxFg1 ctermfg=14 
"

hi htmlBold ctermfg=180 
hi htmlBoldUnderline ctermfg=180
hi htmlBoldItalic ctermfg=180
hi htmlBoldUnderlineItalic ctermfg=180
hi htmlUnderline ctermfg=180
hi htmlUnderlineItalic ctermfg=180
hi htmlItalic ctermfg=180

"require()
hi jsGlobalNodeObjects cterm=italic gui=italic ctermfg=14 guifg=#fe8019

"background color
"hi Normal ctermbg=black
"text color
"hi Normal ctermfg=247

"Visual color selection
hi clear Visual 
hi Visual ctermbg=239 ctermfg=NONE

" Fzfj
hi fzf1 ctermfg=241 ctermbg=235 guifg=#E12672 guibg=#565656
hi fzf2 ctermfg=241 ctermbg=235 guifg=#E12672 guibg=#565656 cterm=bold 
hi fzf3 ctermfg=241 ctermbg=235 guifg=#E12672 guibg=#565656

" Search 
hi Search cterm=reverse ctermfg=179 ctermbg=234 gui=reverse guifg=#fabd2f guibg=#1d2021

" Conditionals
hi GruvboxRed cterm=bold ctermfg=4 guifg=#fb4934

"hide buffer line ~
highlight EndOfBuffer ctermfg=234 ctermbg=234
