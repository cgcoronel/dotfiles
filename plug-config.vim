""""""""""""""""""" Coc extensions
""let g:coc_global_extensions = [ 'coc-prettier', 'coc-tsserver', 'coc-tabnine', 'coc-eslint' ]
let g:coc_global_extensions = [ 'coc-prettier', 'coc-tsserver', 'coc-eslint' ]
let g:coc_snippet_next = '<tab>'

""""""""""""""""""" fzf config
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_action = { 'ctrl-o': 'vsplit' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'Pmenu'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'spinner': ['fg', 'Label'] }

""""""""""""""""""" IndentLine
autocmd Filetype json let g:indentLine_setConceal = 0
let g:indentLine_char_list = ['|'] 
""let g:indentLine_color_term = 237
let g:indentLine_color_term = 8 
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

""""""""""""""""""" NERDTree config
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['^node_modules$', '^.git$']
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 1
let NERDTreeCascadeOpenSingleChildDir = 1
let NERDTreeStatusline= ' '
let NERDTreeDirArrowExpandable = '' 
let NERDTreeDirArrowCollapsible = ''
let NERDTreeWinSize= 40
let g:indentLine_bufNameExclude = ['NERD_tree.*']

"" netrw
let g:netrw_browse_split = 0
let g:netrw_banner = 0 
let g:netrw_winsize = 50
let g:netrw_localrmdir ='rm -r'
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_keepdir = 0
let g:netrw_keepj=""
let g:netrw_altv = 1
let g:netrw_list_hide = '^\.git*,.*\.DS_Store,.\.vscode,node_modules'
let g:netrw_hide = 1       

hi! link netrwMarkFile Search

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nmap <buffer> o <CR>
endfunction


