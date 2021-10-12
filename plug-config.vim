""""""""""""""""""" Coc extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-snippets', 'coc-tabnine']
let g:coc_snippet_next = '<tab>'

""""""""""""""""""" fzf config
let g:fzf_layout = { 'down': '~40%' }

""""""""""""""""""" NERDTree config
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['^node_modules$', '^.git$']
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 0
let NERDTreeCascadeOpenSingleChildDir = 1
let g:indentLine_bufNameExclude = ['NERD_tree.*']
let NERDTreeStatusline=' %{StatuslineGit()}'
let g:NERDTreeWinSize=40

""""""""""""""""""" IndentLine
let g:indentLine_char_list = ['|'] 
autocmd Filetype json let g:indentLine_setConceal = 0
let g:indentLine_color_term = 237

""""""""""""""""""" Blame
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0

""""""""""""""""""" Vim Git Gutter 
" Only show signs when save file
autocmd BufWritePost * GitGutter
