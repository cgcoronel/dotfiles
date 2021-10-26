hi SpecialKey term=bold ctermfg=4 guifg=Blue
hi NonText term=bold cterm=bold ctermfg=4 gui=bold guifg=Blue
hi Directory term=bold ctermfg=4 guifg=Blue
hi IncSearch term=reverse cterm=reverse gui=reverse
hi VisualNOS term=bold,underline cterm=bold,underline gui=bold,underline
hi WildMenu term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow
hi Cursor guifg=bg guibg=fg
hi lCursor guifg=bg guibg=fg
hi Constant term=underline ctermfg=1 guifg=#c00058
hi Special term=bold cterm=italic ctermfg=5 guifg=SlateBlue
hi Identifier term=underline ctermfg=6 guifg=DarkCyan
hi Statement term=bold ctermfg=3 gui=bold guifg=Brown
hi PreProc term=underline ctermfg=5 guifg=Magenta3
hi Type term=underline ctermfg=2 gui=bold guifg=SeaGreen
hi Error term=reverse cterm=bold ctermfg=7 ctermbg=1 gui=bold guifg=White guibg=Red
hi PmenuThumb gui=bold ctermfg=124 ctermfg=black
hi ModeMsg gui=none ctermfg=243 ctermfg=238 
hi LineNr ctermfg=237 guifg=#3c3836
hi Folded cterm=italic ctermfg=245 ctermbg=235 gui=italic guifg=#928374 guibg=#3c3836
hi FoldColumn ctermfg=245 ctermbg=235 guifg=#928374 guibg=#3c3836
hi Comment cterm=italic ctermfg=241 gui=italic guifg=#928374
hi Normal ctermfg=15 guifg=#928374

"Coc suggestion box
hi Pmenu ctermfg=15 ctermbg=236 guifg=bg guibg=#504945
hi PmenuSel ctermfg=234 ctermbg=241 gui=bold guifg=#1d2021 guibg=#fb4934

"notifications simbols in status vertical bar
""hi GitGutterAdd ctermfg=143 ctermbg=234 guifg=#b8bb26 guibg=#3c3836
""hi GitGutterChange ctermfg=108 ctermbg=234 guifg=#8ec07c guibg=#3c3836
""hi GitGutterDelete ctermfg=167 ctermbg=234 guifg=#fb4934 guibg=#3c3836 
""hi GitGutterChangeDelete ctermfg=108 ctermbg=234 guifg=#8ec07c guibg=#3c3836
hi GitGutterAdd ctermfg=240 ctermbg=234 guifg=#b8bb26 guibg=#3c3836
hi GitGutterChange ctermfg=240 ctermbg=234 guifg=#8ec07c guibg=#3c3836
hi GitGutterDelete ctermfg=240 ctermbg=234 guifg=#fb4934 guibg=#3c3836 
hi GitGutterChangeDelete ctermfg=240 ctermbg=234 guifg=#8ec07c guibg=#3c3836

""hi CocErrorSign ctermfg=167 ctembg=234 guifg=#b8bb26 guibg=#3c3836
hi CocWarningSign ctermfg=179 ctermbg=234 guifg=#b8bb26 guibg=#3c3836
hi CocInfoSign ctermfg=179 ctermbg=234 guifg=#b8bb26 guibg=#3c3836
hi CocHintSign ctermfg=109 ctermbg=234 guifg=#b8bb26 guibg=#3c3836

hi SignColumn ctermbg=234 guibg=#3c3836

"Status bar
hi StatusLine cterm=NONE ctermfg=241 ctermbg=235 
hi StatusLineNC cterm=NONE ctermfg=241 ctermbg=235 
hi StatusBar ctermfg=240 guifg=#fb4934 ctermbg=235

"Mode color
hi MsgArea ctermfg=243

"Cursor line
hi CursorLine ctermbg=235 guibg=#3c3836 cterm=NONE
hi CursorLineNr ctermfg=3 ctermbg=235 guifg=#fabd2f guibg=#3c3836

hi Ignore cterm=bold ctermfg=241 guifg=bg

hi String ctermfg=144 guifg=#b8bb26

"highlighting TODO
hi Todo cterm=bold ctermfg=234 ctermbg=167 gui=bold guifg=#1d2021 guibg=#fb4934

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

" Fzf
hi fzf1 ctermfg=241 ctermbg=235 guifg=#E12672 guibg=#565656
hi fzf2 ctermfg=241 ctermbg=235 guifg=#E12672 guibg=#565656 cterm=bold 
hi fzf3 ctermfg=241 ctermbg=235 guifg=#E12672 guibg=#565656

" Search 
hi Search cterm=reverse ctermfg=179 ctermbg=234 gui=reverse guifg=#fabd2f guibg=#1d2021

"hide buffer line ~
hi EndOfBuffer cterm=bold ctermfg=237 ctermbg=234

hi Title ctermfg=11 
hi VertSplit ctermfg=234 ctermbg=235

hi MoreMsg  ctermfg=243 gui=bold guifg=SeaGreen
hi ErrorMsg cterm=reverse ctermfg=167 ctermbg=234 gui=reverse guifg=#fb4934 guibg=#1d2021
hi Question ctermfg=243 gui=bold guifg=Green

"git diff
hi DiffAdd cterm=reverse ctermfg=10 ctermbg=234 gui=reverse guifg=#b8bb26 guibg=#1d2021
hi DiffText cterm=reverse ctermfg=179 ctermbg=234 gui=reverse guifg=#fabd2f guibg=#1d2021
hi DiffChange cterm=reverse ctermfg=108 ctermbg=234 gui=reverse guifg=#8ec07c guibg=#1d2021
hi DiffDelete term=bold cterm=bold ctermfg=4 ctermbg=235 gui=bold guifg=LightBlue guibg=#f6e8d0

hi WarningMsg ctermfg=243 guifg=Red

hi MatchParen ctermbg=14 ctermfg=0
hi Function cterm=italic ctermfg=6 guifg=DarkCyan

hi netrwTreeBar term=bold cterm=none ctermfg=237 guifg=SlateBlue

