""hi SpecialKey term=bold ctermfg=4 guifg=Blue
""hi NonText term=bold cterm=bold ctermfg=4 gui=bold guifg=Blue
""hi Directory term=bold ctermfg=4 guifg=Blue
""hi IncSearch term=reverse cterm=reverse gui=reverse
""hi VisualNOS term=bold,underline cterm=bold,underline gui=bold,underline
""hi WildMenu term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow
""hi Cursor guifg=bg guibg=fg
""hi lCursor guifg=bg guibg=fg
""hi Constant term=underline ctermfg=1 guifg=#c00058
""hi Special term=bold cterm=italic ctermfg=5 guifg=SlateBlue
""hi Identifier term=underline ctermfg=6 guifg=DarkCyan
""hi Statement term=bold ctermfg=3 gui=bold guifg=Brown
""hi PreProc term=underline ctermfg=5 guifg=Magenta3
""hi Type term=underline ctermfg=2 gui=bold guifg=SeaGreen
""hi Error term=reverse cterm=bold ctermfg=7 ctermbg=1 gui=bold guifg=White guibg=Red
""hi PmenuThumb gui=bold ctermfg=124 ctermfg=black
""hi ModeMsg gui=none ctermfg=243 ctermfg=241 
hi Folded cterm=italic ctermfg=245 ctermbg=8 gui=italic guifg=#928374 guibg=#3c3836
hi FoldColumn ctermfg=0 ctermbg=0
""hi Comment cterm=italic ctermfg=241 gui=italic guifg=#928374
""hi Normal ctermfg=15 guifg=#928374

"Coc suggestion box
hi Pmenu ctermfg=15 ctermbg=8 guifg=bg guibg=#504945
hi PmenuSel ctermfg=0 ctermbg=241 gui=bold guifg=#1d2021 guibg=#fb4934

"notifications simbols in status vertical bar
hi GitGutterAdd ctermfg=8 ctermbg=0 guifg=#b8bb26 guibg=#3c3836
hi GitGutterChange ctermfg=8 ctermbg=0 guifg=#8ec07c guibg=#3c3836
hi GitGutterDelete ctermfg=8 ctermbg=0 guifg=#fb4934 guibg=#3c3836 
hi GitGutterChangeDelete ctermfg=8 ctermbg=0 guifg=#8ec07c guibg=#3c3836

"hi CocErrorSign ctermfg=167 ctembg=0 guifg=#b8bb26 guibg=#3c3836
""hi CocWarningSign ctermfg=179 ctermbg=0 guifg=#b8bb26 guibg=#3c3836
""hi CocInfoSign ctermfg=179 ctermbg=0 guifg=#b8bb26 guibg=#3c3836
""hi CocHintSign ctermfg=109 ctermbg=0 guifg=#b8bb26 guibg=#3c3836

hi SignColumn ctermbg=0 guibg=#3c3836

"Status bar
hi StatusLine cterm=NONE ctermfg=243 ctermbg=8
hi StatusLineNC cterm=NONE ctermfg=243 ctermbg=8

""hi StatusBar ctermfg=240 guifg=#fb4934 ctermbg=8
""hi ProjectName ctermfg=5 ctermbg=8 guifg=Magenta3

"""Mode color
hi MsgArea ctermfg=243

"""Cursor line
hi CursorLine ctermbg=NONE guibg=#3c3836 cterm=NONE
hi CursorLineNr cterm=none ctermfg=244 ctermbg=NONE guifg=#fabd2f guibg=#3c3836
hi LineNr ctermfg=8 guifg=#3c3836

hi Ignore cterm=bold ctermfg=241 guifg=bg

""hi String ctermfg=144 guifg=#b8bb26

"highlighting TODO
hi Todo cterm=bold ctermfg=0 ctermbg=167 gui=bold guifg=#1d2021 guibg=#fb4934

"""require()
""hi jsGlobalNodeObjects cterm=italic ctermfg=14

"Visual color selection
hi clear Visual 
hi Visual ctermbg=8 ctermfg=NONE

""" Fzf
""hi fzf1 ctermfg=241 ctermbg=8 guifg=#E12672 guibg=#565656
""hi fzf2 ctermfg=241 ctermbg=8 guifg=#E12672 guibg=#565656 cterm=bold 
""hi fzf3 ctermfg=241 ctermbg=8 guifg=#E12672 guibg=#565656

" Search 
hi Search cterm=reverse ctermfg=179 ctermbg=0 gui=reverse guifg=#fabd2f guibg=#1d2021

"""hide buffer line ~
""hi EndOfBuffer cterm=bold ctermfg=8 ctermbg=0

""hi Title ctermfg=11 
hi VertSplit ctermfg=0 ctermbg=8

""hi MoreMsg  ctermfg=243 gui=bold guifg=SeaGreen
""hi ErrorMsg cterm=reverse ctermfg=167 ctermbg=0 gui=reverse guifg=#fb4934 guibg=#1d2021
""hi Question ctermfg=243 gui=bold guifg=Green

"git diff
hi DiffAdd cterm=reverse ctermfg=10 ctermbg=0 gui=reverse guifg=#b8bb26 guibg=#1d2021
hi DiffText cterm=reverse ctermfg=179 ctermbg=0 gui=reverse guifg=#fabd2f guibg=#1d2021
hi DiffChange cterm=reverse ctermfg=108 ctermbg=0 gui=reverse guifg=#8ec07c guibg=#1d2021
hi DiffDelete term=bold cterm=bold ctermfg=4 ctermbg=0 gui=bold guifg=LightBlue guibg=#f6e8d0

""hi WarningMsg ctermfg=243 guifg=Red
""
""hi MatchParen ctermbg=14 ctermfg=0
""hi Function cterm=italic ctermfg=6 guifg=DarkCyan
""
""hi netrwTreeBar term=bold cterm=none ctermfg=237 guifg=SlateBlue
""
""hi ALEErrorSign ctermfg=11 gui=bold guifg=Magenta
""hi ALEWarningSign ctermfg=11 gui=bold guifg=Magenta
""
""hi ALEWarning cterm=bold ctermfg=238
""hi ALEStyleWarning cterm=bold ctermfg=238
""hi ALEStyleError cterm=bold ctermfg=238
""hi SpellBad ctermfg=9 cterm=underline ctermbg=none gui=underline guibg=DarkGrey guisp=red 
""
"""nerdtree
""hi NERDTreeCWD ctermfg=244 gui=bold guifg=Brown
""
""hi IndentBlanklineChar cterm=nocombine ctermfg=8 gui=nocombine guifg=Blue
