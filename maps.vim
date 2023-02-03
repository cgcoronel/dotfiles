let mapleader = "\<space>"

" File Explorer
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
map <silent> <nowait> <leader>q :call CloseFile()<CR>

" Split file
nmap s :vsp<CR>
nmap S :sp<CR>

" Move between split screens
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

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

" Autocomplete parents pairs
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ` ``<Esc>i
inoremap " ""<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i

" Mover up/down in 10 lines bloc
map <C-J> 10j
map <C-K> 10k

" Move in file 
map gl $
map gh 0
map gk H
map gj L

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
  autocmd filetype fugitive nmap <buffer> <nowait> <silent> ff dd :resize 100<CR> 
  autocmd filetype fugitive nmap <buffer> <nowait> <silent> o gO <C-l>:q<CR> 
augroup END

cnoreabbrev gco Git commit 
cnoreabbrev gpu Git push 
cnoreabbrev gbb Git blame --date short 
cnoreabbrev gcc BCommits 

" Move between uncommit changes 
nnoremap <silent> <CR> :GitGutterNextHunk<CR>
nnoremap <silent> <backspace> :GitGutterPrevHunk<CR>

" Run test in focus file   
cnoreabbrev te :call SimpleTerm('npx jest --resetMocks --forceExit --bail --runInBand --watch ' . expand('%'), 0) 

" fix linter
cnoreabbrev fix :call SimpleTerm('npx eslint --fix ' . expand('%'), 0) 

"Move lines up / down
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
 
nmap <Leader>a :ZenMode<CR>

