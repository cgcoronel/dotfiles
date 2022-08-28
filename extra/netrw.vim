
map <Leader>e :let @/=expand("%:t") <Bar> execute 'Explore' expand("%:h") <Bar> normal n<CR>
map <Leader>n :let @/=expand("%:t") <Bar> execute 'Explore' expand("%:h") <Bar> normal n<CR>

let g:netrw_liststyle = 4 
let g:netrw_keepdir = 1
let g:netrw_altv=1
let g:netrw_list_hide = '^\.git*,.*\.DS_Store,.\.vscode,node_modules'
let g:netrw_hide = 1       
let g:netrw_fastbrowse = 2
let g:netrw_bufsettings = 'nonu noma nomod nobl nowrap ro'

hi! link netrwMarkFile Search
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nmap <buffer> o <CR>
  nmap <buffer> = <CR>
  nmap <buffer> s <CR>
  nmap <buffer> m R
  nmap <buffer> r D
  nmap <buffer> a %
endfunction
