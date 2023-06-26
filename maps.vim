let mapleader = "\<Space>"

" Explorer
nnoremap <Leader>e :let @/=expand("%:t") <Bar> execute 'Explore' expand("%:h") <Bar> normal n<CR>

inoremap kj <Esc>

nnoremap <F8> :set number <Bar> set relativenumber!<CR>

function! Close()
  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    q
  else
    bdelete
  endif
endfunction

noremap <nowait> <Leader>q :call Close()<CR>

" Split
nnoremap s :vsp<CR>
nnoremap S :sp<CR>

" Move between split screens
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

inoremap <C-L> <Esc><C-W><C-L>
inoremap <C-H> <Esc><C-W><C-H>

" Move between buffers
nnoremap m :bprevious<CR>
nnoremap . :bnext<CR>

" Got to definitions local
nnoremap fs gd
nnoremap fd gf

" Save
nnoremap <Leader>w :w<CR>

" Autocomplete parents pairs
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ` ``<Esc>i
inoremap " ""<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i

" Move next/prev 10 lines
noremap <C-J> 10j
noremap <C-K> 10k

" Move start - end line
noremap gl $
noremap gh 0

" Search
nnoremap <Leader>f :GitFiles<CR>
nnoremap > :Rg<CR>

" Clean search result
noremap <Leader><Space> :noh<CR>

" Show file changes
nnoremap <Leader>d :0Git<CR>

" Compare files
augroup fugitive_mapping
  autocmd!
  autocmd filetype fugitive nmap <buffer> <nowait> <silent> ff dv :resize 100<CR>
  autocmd filetype fugitive nmap <buffer> <nowait> <silent> o gO <C-l>:q<CR>
augroup END

cnoreabbrev gco Git commit
cnoreabbrev gpu Git push
cnoreabbrev gbb Git blame --date short

" Move between uncommit changes
nnoremap <CR> :GitGutterNextHunk<CR>
nnoremap <Backspace> :GitGutterPrevHunk<CR>

" Move line
nnoremap <S-j> :m .+1<CR>
nnoremap <S-k> :m .-2<CR>

" Run test focus file
cnoreabbrev te :call SimpleTerm('npx jest --resetMocks --forceExit --bail --runInBand --watch ' . expand('%'), 0)

" fix linter
cnoreabbrev fix :call SimpleTerm('npx eslint --fix ' . expand('%'), 0)

nnoremap cp :let @+ = expand("%")<CR>
