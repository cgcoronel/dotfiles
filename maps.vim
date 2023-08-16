let mapleader = "\<Space>"

nnoremap <Leader>e :let @/=expand("%:t") <Bar> execute 'Explore' expand("%:h") <Bar> normal n<CR>

inoremap kj <Esc>

nnoremap <F8> :set number <Bar> set relativenumber!<CR>

function! Quit()
  let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val)')
  if len(buffers) == 1 | q | else | bd | endif
endfunction

noremap <nowait> <Leader>q :call Quit()<CR>

" Split
nnoremap s :vsp<CR>

" Move between split screens
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

inoremap <C-L> <Esc><C-W><C-L>
inoremap <C-H> <Esc><C-W><C-H>

" Got to definitions local
"nnoremap fs gd
"nnoremap fd gf

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

" Move between buffers
noremap . :bnext<cr>
noremap m :bprevious<cr> 

" Move start - end line
noremap gl $
noremap gh 0

" Search
""nnoremap > :Rg<CR>
"nnoremap <Leader>f :GitFiles<CR>
"nnoremap <Leader>s :GitFiles?<CR>
""nnoremap <Leader>f :call fzf#vim#gitfiles('*', {'options': '--no-preview'})<CR>
""nnoremap <Leader>s :call fzf#vim#gitfiles('?', {'options': '--no-preview'})<CR>

nnoremap > :Telescope live_grep<CR>
nnoremap < :Telescope git_branches<CR>
nnoremap <leader>f :Telescope fd<CR>

" Clean search result
noremap <Leader><Space> :noh<CR>

" Show file changes
nnoremap <Leader>d :0Git<CR>

augroup fugitive_mapping
  autocmd!
  autocmd filetype fugitive nmap <buffer> <nowait> <silent> ff dv :resize 100<CR>
  autocmd filetype fugitive nmap <buffer> <nowait> <silent> o gO <C-l>:q<CR>
augroup END

" Remaps for git
cnoreabbrev gco Git commit
cnoreabbrev gpu Git push
cnoreabbrev gbb Git blame --date short

" Move between uncommit changes
nnoremap <CR> :GitGutterNextHunk<CR>
nnoremap <Backspace> :GitGutterPrevHunk<CR>

" Move line
nnoremap <S-j> :m .+1<CR>
nnoremap <S-k> :m .-2<CR>

command! TestJest :vsp | wincmd l | exec 'term npx jest --resetMocks --forceExit --bail --runInBand --watch ' . expand('%')
cnoreabbrev te TestJest

command! EslintFix :sp | wincmd j | resize 15 | exec 'term npx eslint --fix ' . expand('%')
cnoreabbrev fix EslintFix 

nnoremap cp :let @+ = expand("%")<CR>
