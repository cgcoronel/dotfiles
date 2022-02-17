"" netrw
let g:netrw_browse_split = 0
let g:netrw_banner = 0 
let g:netrw_winsize = 50
let g:netrw_localrmdir ='rm -r'
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_liststyle = 3 
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
  nmap <buffer> s v 
""  nmap <buffer> m R
""  nmap <buffer> mm mtmfmc
  nmap <buffer> r D
  nmap <buffer> a %
endfunction

let mapleader = "\<space>"

" Open file explore netrw
nnoremap <leader>e :Ex<CR>
nnoremap <leader>n :Ex<CR>

" Seach word into files
""nmap <Leader>f :call fzf#run({'sik': 'e', 'down': '~45%', 'options': ['-i'], 'dir': project})<CR>

" Seach word into files
command! -bang -nargs=* PRg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'dir': project}), <bang>0)
nmap ? :PRg<CR>
nmap > :PRg<CR>

function! MoveFile()
  let old = expand('%')
  let new = input('', expand('%'))
  
  if (new == old)
    return 0
  else  
    exe 'sav' fnameescape(new)
    call delete(old)
  endif
endfunction

command! -bar Mv call MoveFile()
cnoreabbrev mv Mv

function! CopyFile()
  let new = input('', expand('%'))
  exe 'sav' fnameescape(new)
endfunction

command! -bar Cp call CopyFile()
cnoreabbrev cp Cp 

function! RemoveFile()
  call delete(expand('%')) | bdelete!
endfunction

command! -bar Rem call RemoveFile()
cnoreabbrev rm Rem 


