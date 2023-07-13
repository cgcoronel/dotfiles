" Coc
let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-json']
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" fzf config
let g:fzf_action = { 'ctrl-o': 'vsplit' }
let g:fzf_colors = { 'border': ['fg', 'Conceal'], 'bg+': ['bg', 'Visual' ] }
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }

function! ListFiles()
  let buffers = []
  for i in range(1, bufnr('$'))
    if buflisted(i) && bufname(i) !=# '' && filereadable(bufname(i)) 
      call add(buffers, bufname(i))
    endif
  endfor

  let fileSelected = fzf#run({
        \ 'source': buffers,
        \ 'sink': 'e',
        \ 'window': { 'width': 0.4, 'height': 0.5 },
        \ })

  if !empty(fileSelected)
    execute 'e ' . fileSelected
  endif
endfunction

nnoremap <silent> F :call ListFiles()<CR>


" Git Gutter - Only show signs when saving file
autocmd BufWritePost * GitGutter

let g:gitgutter_highlight_linenrs = 0 
let g:gitgutter_map_keys = 0

" fugitive
let g:fugitive_dynamic_colors = 0 

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

function! NetrwMapping() abort
  setlocal nocursorline
  nmap <buffer> <nowait> c :call CopyFile()<CR>
  nmap <buffer> <nowait> o <CR>
  nmap <buffer> <nowait> p -
  nmap <buffer> <nowait> a %
  nmap <buffer> <nowait> s v<C-h>
  nmap <buffer> <nowait> m :bprevious<CR>
  nmap <buffer> <nowait> . :bnext<CR>
endfunction

