"" netrw
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_liststyle = 3 
let g:netrw_keepdir = 0

hi! link netrwMarkFile Search

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nmap <buffer> o <CR>
  nmap <buffer> m R
  nmap <buffer> r D
  nmap <buffer> a %
endfunction
