""""""""""""""""""" Coc extensions
let g:coc_global_extensions = [ 'coc-prettier', 'coc-tsserver', 'coc-eslint' ]

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""""""""""""""""""" fzf config
let g:fzf_action = { 'ctrl-o': 'vsplit' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_colors =
  \ { 'pointer': ['fg', 'Exception'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'border':  ['fg', 'Conceal'],
  \ 'gutter':  ['fg', 'Visual'],
  \ 'bg+':     ['bg', 'Visual' ],
  \ 'info':    ['fg', 'PreProc'] }

""""""""""""""""""" Vim Git Gutter 
" Only show signs when save file
autocmd BufWritePost * GitGutter

let g:gitgutter_highlight_linenrs = 0 
let g:gitgutter_map_keys = 0

""""""""""""""""""" Vim Fugitive
let g:fugitive_dynamic_colors = 0 

""""""""""""""""""" Simple terminal
let g:simple_term_open = '<c-p>' 
let g:simple_term_close = '<Leader>q' 

""""""""""""""""""" Netrw 
let g:netrw_liststyle = 4 
let g:netrw_keepdir = 1
let g:netrw_altv=1
let g:netrw_list_hide = '.*\.DS_Store,.\.vscode,node_modules'
let g:netrw_hide = 1       
let g:netrw_fastbrowse = 2
let g:netrw_bufsettings = 'nonu noma nomod nobl nowrap ro'
let g:netrw_banner = 0

hi! link netrwMarkFile Search
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nmap <buffer> o <CR>
  nmap <buffer> p - 
  nmap <buffer> a %
endfunction

"""""""""""""""""" IndentLine
autocmd Filetype json let g:indentLine_setConceal = 0
let g:indentLine_char_list = ['│'] 
let g:indentLine_color_term = 8 
let g:indentLine_fileTypeExclude = ["help"]
let g:indentLine_bufTypeExclude = ["help"]
let g:indentLine_indentLevel = 3 


