let mapleader = "\<space>"

" File Explorer
"nmap <silent> <Leader>e :NERDTreeFind<CR>
"nmap <silent> <Leader>n :NERDTreeFind<CR>
nmap <Leader>n :let @/=expand("%:t") <Bar> execute 'Explore' expand("%:h") <Bar> normal n<CR>
nmap <Leader>e :let @/=expand("%:t") <Bar> execute 'Explore' expand("%:h") <Bar> normal n<CR>

" Leave INSERT MODE
imap kj <Esc>

nmap <silent> <F8> :set relativenumber!<cr>

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
nmap <silent> m :bprevious<CR>
nmap <silent> . :bnext<CR>

" Got to definitions local
nnoremap fs gd
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
nmap <Leader>f :GitFiles<CR>

" Clean search result
noremap <silent> <Leader><space> :noh<CR>

" Seach word into files
nmap > :Rg<CR>

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

" Run test current file
cnoreabbrev te :vsp<cr> :exe ':term npx jest --watch ' . expand('%') 

" Commands for terminal
cnoreabbrev t :sp<cr> <C-w><C-j> :resize 15<cr> :term<cr>i 
nmap <C-p> :t<CR>
tnoremap <silent> <Esc> <C-\><C-n> 



