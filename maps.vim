":help key-notation

let mapleader = "\<space>"

""""""""""""""""""""""" Remap Global Shortcuts

" VISUAL BLOCK 
""map f <C-V><left>

" File Explorer
nmap <silent> <Leader>e :NERDTreeFind<CR>
nmap <silent> <Leader>n :NERDTreeFind<CR>

" Leave INSERT MODE
imap kj <Esc>

""""""""""""""""""""""" Interaction with files 

" Change size of current file window
nnoremap <C-i> 5<C-w><
nnoremap <C-,> 5<C-w>>

" Close each buffer and close vim 
function! CloseFile()
  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    :q 
  else
    :bdelete
  endif
endfunction

" Close file
map <silent> <Leader>q :call CloseFile()<CR>
" Split file
nmap s :vsp<CR>
nmap S :sp<CR>

" Move between split screens
map <Leader>j <Esc><C-W><C-J>
map <Leader>k <Esc><C-W><C-K>
map <C-L> <Esc><C-W><C-L>
map <C-H> <Esc><C-W><C-H>

imap <C-L> <Esc><C-W><C-L>
imap <C-H> <Esc><C-W><C-H>

" move between buffers
"nmap <silent> m :bprevious<CR>
"nmap <silent> . :bnext<CR>

" Got to definitions local
nnoremap fs gd

" Go to definition file, search firts occurrence, and search require('....
nmap fd gf

" Save file 
nmap <Leader>w :w<CR>

"Move lines up / down
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==

" Autocomplete parents pairs
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ` ``<Esc>i
inoremap { {}<Esc>i

inoremap f/ */<Esc>
inoremap /f /*<Esc>

" Mover up/down in 10 lines bloc
map <C-J> 10j
map <C-K> 10k

" Move in file 
nnoremap gl $
nnoremap gh 0
nnoremap gk H
nnoremap gj L

vnoremap gl $
vnoremap gh 0
vnoremap gk H
vnoremap gj L


""""""""""""""""""""""" Search into files 

" Finder
nmap <Leader>f :FZF<CR>

" Clean search result
noremap <silent> <Leader><space> :noh<CR>

" Seach word into files
nmap > :Rg<CR>

" Command find and replace
command! -nargs=+ Replace :%s/<args>/gc
cnoreabbrev replace Replace


""""""""""""""""""""""" GIT Commands 

" Show file changes 
nmap <silent> <Leader>d :0Git<CR>

" Compare files
augroup fugitive_mapping
  autocmd!
  autocmd filetype fugitive nmap <buffer> <silent> ff dd :resize 100<CR> 
  autocmd filetype fugitive nmap <buffer> <silent> o gO <C-l>:q<CR> 
augroup END

cnoreabbrev gco Git commit 
cnoreabbrev gpu Git push 
cnoreabbrev gbb Git blame --date short 
cnoreabbrev gcc BCommits 

" Move between uncommit changes 
nnoremap <silent> <CR> :GitGutterNextHunk<CR>
nnoremap <silent> <backspace> :GitGutterPrevHunk<CR>

nmap <silent> <F8> :set relativenumber!<cr>
""""""""""""""""""""""" Commands for development

" Run test in focus file   
cnoreabbrev te :call SimpleTerm('npx jest --watch ' . expand('%'), 0) 

" Run test in focus describe
cnoreabbrev td :call SimpleTerm('npx jest --watch -t "' . GetDescribe() . '" ' . expand('%'), 0) 

" Run test in focus it 
cnoreabbrev ti :call SimpleTerm('npx jest --watch -t "' . GetFullDescribe() . '" ' . expand('%'), 0) 


