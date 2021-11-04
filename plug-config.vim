""""""""""""""""""" Coc extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier']
let g:coc_snippet_next = '<tab>'

""""""""""""""""""" fzf config
let g:fzf_layout = { 'down': '~50%' }

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
