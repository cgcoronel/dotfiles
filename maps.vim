let mapleader = "\<space>"

" Explorer
nmap <Leader>e :let @/=expand("%:t") <Bar> execute 'Explore' expand("%:h") <Bar> normal n<CR>

imap kj <Esc>

nmap <silent> <F8> :set relativenumber!<cr>

function! CloseFile()
  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    :q 
  else
    :bdelete
  endif
endfunction

map <silent> <nowait> <leader>q :call CloseFile()<CR>

" Split
nmap s :vsp<CR>
nmap S :sp<CR>

" Move between split screens
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

imap <C-L> <Esc><C-W><C-L>
imap <C-H> <Esc><C-W><C-H>

" Move between buffers
nmap <silent> m :bprevious<CR>
nmap <silent> . :bnext<CR>

" Got to definitions local
nnoremap fs gd
nmap fd gf

" Save  
nmap <Leader>w :w<CR>

" Autocomplete parents pairs
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ` ``<Esc>i
inoremap " ""<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i

" Move next/prev 10 lines
map <C-J> 10j
map <C-K> 10k

" Move start - end line 
map gl $
map gh 0

" Search
nmap <Leader>f :GitFiles<CR>
nmap > :Rg<CR>

" Clean search result
noremap <silent> <Leader><space> :noh<CR>

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

" Move between uncommit changes 
nnoremap <silent> <CR> :GitGutterNextHunk<CR>
nnoremap <silent> <backspace> :GitGutterPrevHunk<CR>

" Move line 
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==

" Run test focus file   
cnoreabbrev te :call SimpleTerm('npx jest --resetMocks --forceExit --bail --runInBand --watch ' . expand('%'), 0) 

" fix linter
cnoreabbrev fix :call SimpleTerm('npx eslint --fix ' . expand('%'), 0) 

nmap cp :let @+ = expand("%")<cr>
