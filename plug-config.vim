""""""""""""""""""" Coc extensions
let g:coc_global_extensions = [ 'coc-prettier', 'coc-tsserver', 'coc-tabnine', 'coc-eslint' ]
let g:coc_snippet_next = '<tab>'

""""""""""""""""""" fzf config
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_action = { 'ctrl-o': 'vsplit' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'Pmenu'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'spinner': ['fg', 'Label'] }

""""""""""""""""""" IndentLine
autocmd Filetype json let g:indentLine_setConceal = 0
let g:indentLine_char_list = ['|'] 
let g:indentLine_color_term = 237
let g:indentLine_fileTypeExclude = ["help"]
let g:indentLine_bufTypeExclude = ["help"]
let g:indentLine_indentLevel = 5 

""""""""""""""""""" Vim Git Gutter 
" Only show signs when save file
autocmd BufWritePost * GitGutter
let g:gitgutter_highlight_linenrs = 0 
let g:gitgutter_map_keys = 0

""""""""""""""""""" Vim Fugitive
let g:fugitive_dynamic_colors = 0 

""""""""""""""""""" Simple terminal
let g:simple_term_close = '<Leader>q' 
