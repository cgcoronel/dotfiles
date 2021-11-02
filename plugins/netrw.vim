"" netrw
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 50
let g:netrw_localrmdir='rm -r'
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_liststyle = 3 
let g:netrw_keepdir = 0
let g:netrw_altv=1
let g:netrw_altv = 1
let g:netrw_list_hide = '^\.git*,.*\.DS_Store,.\.vscode,node_modules'
let g:netrw_hide = 1       
let g:netrw_fastbrowse = 2

hi! link netrwMarkFile Search
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nmap <buffer> o <CR>
  nmap <buffer> s <CR>
  nmap <buffer> m R
  nmap <buffer> r D
  nmap <buffer> a %
endfunction

" Save project dir in var
autocmd VimEnter * let g:project = getcwd() 
