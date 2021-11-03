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


let s:dotfiles = '\(^\|\s\s\)\zs\.\S\+'

function! Opendir(cmd) abort
  let df = ','.s:dotfiles

  if expand('%:t')[0] ==# '.' && g:netrw_list_hide[-strlen(df):-1] ==# df
    let g:netrw_list_hide = g:netrw_list_hide[0 : -strlen(df)-1]
  endif

  if &filetype ==# 'netrw' && len(s:netrw_up)
    let basename = fnamemodify(b:netrw_curdir, ':t')
    execute s:netrw_up
    call Seek(basename)
  elseif expand('%') =~# '^$\|^term:[\/][\/]'
    execute a:cmd '.'
  else
    execute a:cmd '%:h' . (expand('%:p') =~# '^\a\a\+:' ? s:slash() : '')
    call Seek(expand('#:t'))
  endif

endfunction

function! Seek(file) abort
  if get(b:, 'netrw_liststyle') == 2
    let pattern = '\%(^\|\s\+\)\zs'.escape(a:file, '.*[]~\').'[/*|@=]\=\%($\|\s\+\)'
  else
    let pattern = '^\%(| \)*'.escape(a:file, '.*[]~\').'[/*|@=]\=\%($\|\t\)'
  endif

  call search(pattern, 'wc')

  return pattern
endfunction

nnoremap <leader>e :call Opendir('Vexplore')<CR>
nnoremap <leader>n :call Opendir('edit')<CR>


