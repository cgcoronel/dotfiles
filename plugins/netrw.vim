"" netrw
let g:netrw_browse_split = 0
let g:netrw_banner = 1 
let g:netrw_winsize = 50
let g:netrw_localrmdir ='rm -r'
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_liststyle = 3 
let g:netrw_keepdir = 0
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
  nmap <buffer> s v 
""  nmap <buffer> m R
  nmap <buffer> r D
  nmap <buffer> a %
endfunction

" Save project dir in var
autocmd VimEnter * let g:project = getcwd() 


" Open file explore netrw
""nnoremap <leader>e :exec 'edit ' . project<CR>
""nnoremap <leader>n :exec 'edit ' . project<CR>

" Seach word into files
""nmap <Leader>f :call fzf#run({'sink': 'e', 'down': '~25%', 'options': ['-i'], 'dir': project})<CR>

" Seach word into files
""command! -bang -nargs=* PRg
""  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'dir': project}), <bang>0)
""nmap ? :PRg<CR>


