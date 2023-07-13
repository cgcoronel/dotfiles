let mapleader = "\<Space>"

nnoremap <Leader>e :let @/=expand("%:t") <Bar> execute 'Explore' expand("%:h") <Bar> normal n<CR>

inoremap kj <Esc>

nnoremap <F8> :set number <Bar> set relativenumber!<CR>

function! Quit()
  let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val)')
  if len(buffers) == 1 | q | else | bdelete | endif
endfunction

noremap <nowait> <Leader>q :call Quit()<CR>

" Split
nnoremap s :vsp<CR>

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
nnoremap > :Rg<CR>
nnoremap <Leader>f :call fzf#vim#gitfiles('*', {'options': '--no-preview', 'window': { 'width': 0.4, 'height': 0.5 }})<CR>
nnoremap <Leader>s :call fzf#vim#gitfiles('?', {'options': '--no-preview', 'window': { 'width': 0.4, 'height': 0.5 }})<CR>

" Clean search result
noremap <Leader><Space> :noh<CR>

" Show file changes
nnoremap <Leader>d :0Git<CR>

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

cnoreabbrev te :call Term('npx jest --resetMocks --forceExit --bail --runInBand --watch ' . expand('%'))
cnoreabbrev fix :call Term('npx eslint --fix ' . expand('%'))

nnoremap cp :let @+ = expand("%")<CR>
