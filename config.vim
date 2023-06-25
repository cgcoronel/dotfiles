" Coc
let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-json']
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" fzf config
let g:fzf_action = { 'ctrl-o': 'vsplit' }
let g:fzf_colors = {
      \ 'pointer': ['fg', 'Exception'],
      \ 'prompt': ['fg', 'Conditional'],
      \ 'border': ['fg', 'Conceal'],
      \ 'gutter': ['fg', 'Visual'],
      \ 'bg+': ['bg', 'Visual' ],
      \ 'info': ['fg', 'PreProc']
      \ }
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }

" Git Gutter - Only show signs when saving file
autocmd BufWritePost * GitGutter

let g:gitgutter_highlight_linenrs = 0 
let g:gitgutter_map_keys = 0

" fugitive
let g:fugitive_dynamic_colors = 0 

" Simple terminal
let g:simple_term_open = '<c-p>' 
let g:simple_term_close = '<Leader>q' 

" Netrw 
let g:netrw_keepdir = 1
let g:netrw_altv = 1
let g:netrw_list_hide = '.*\.DS_Store,.\.vscode,node_modules'
let g:netrw_hide = 1       
let g:netrw_fastbrowse = 2
let g:netrw_bufsettings = 'nonu noma nomod nobl nowrap ro'
let g:netrw_banner = 0

function! CopyFile()
  let file = expand("%:p") . netrw#Call('NetrwGetWord')
  let newfile = input('Copy file: ', file)
  silent execute '!cp' file newfile
endfunction

hi! link netrwMarkFile Search
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  setlocal nocursorline
  nmap <buffer> <nowait> c :call CopyFile()<CR>
  nmap <buffer> <nowait> o <CR>
  nmap <buffer> <nowait> p -
  nmap <buffer> <nowait> a %
  nmap <buffer> <nowait> s v<C-h>
  nmap <buffer> <nowait> m :bprevious<CR>
  nmap <buffer> <nowait> . :bnext<CR>
endfunction

