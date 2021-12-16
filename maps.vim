":help key-notation

let mapleader = "\<space>"

""""""""""""""""""""""" Remap Global Shortcuts

" Enter COMMAND MODE
map ; :

" Enter VISUAL BLOCK 
map f <C-V><left>

" Enter COMMAND LINE 
map <silent> t :call RunCmd()<CR> 

" Open file explorer
""nmap <silent> <Leader>e :buffer NERD_tree_1<CR>
nmap <silent> <Leader>e :NERDTreeFind<CR>
nmap <silent> <Leader>n :NERDTreeFind<CR>

" Leave INSERT MODE
imap kj <Esc>

""""""""""""""""""""""" Interaction with files 

" Change size of current file window
nnoremap <Leader>m 20<C-w><
nnoremap <Leader>. 20<C-w>>

" Show opened files
nmap <silent> <Leader>; :call fzf#vim#buffers({'down': '~25%'})<CR>

" Close vim
map <silent> Q :q<CR>

" Close file
map <silent> <Leader>q :call CloseFile()<CR>

" Copy one word
map ci bye 

" Split file in vertical 
nmap s :vsplit<CR>

" Split file in horizontal 
nmap S :split<CR>

" Move focus between split screens
map <Leader>j <Esc><C-W><C-J>
map <Leader>k <Esc><C-W><C-K>
map <C-L> <Esc><C-W><C-L>
map <C-H> <Esc><C-W><C-H>

""imap <C-J> <Esc><C-W><C-J>
""imap <C-K> <Esc><C-W><C-K>
imap <C-L> <Esc><C-W><C-L>
imap <C-H> <Esc><C-W><C-H>

" Got to definitions local
nnoremap fs gd

" Go to definition file, search firts occurrence, and search require('....
nmap ff :call search('\V' . '(')<CR> gf
nmap fd gf

" Save file 
nmap <Leader>w :w<CR>

" Save file without prettier format
cmap ww :noa w<CR>

" Select all text
nnoremap <Leader>a <Esc>ggVG<CR>

"Move lines up / down
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==

" Autocomplete parents pairs
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ` ``<Esc>i
inoremap { {}<Esc>i

inoremap /f /*<Esc>
inoremap f/ */<Esc>
inoremap /d ()<Esc>i
inoremap /s []<Esc>i
inoremap /a {}<Esc>i

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
nmap <Leader>f :call fzf#run({'sink': 'e', 'down': '~25%', 'options': ['-i']})<CR>

" Clean search result
nnoremap <silent> <Leader><space> :noh<cr>

" Seach word into files
nmap ? :Rg<CR>
nmap > :Rg<CR>

" Command find and replace
command! -nargs=+ Replace :%s/<args>/gc
cnoreabbrev replace Replace


""""""""""""""""""""""" GIT Commands 

" Show git blame 
cmap bb :Git blame --date short<CR>

" Show diferences 
nmap <Leader>c :Gdiffsplit<CR>

" Show file changes 
nmap <silent> <Leader>d :0Git<CR>

" Compare files
augroup fugitive_mapping
  autocmd!
  autocmd filetype fugitive nmap <buffer> ff dd :resize 45<CR> 
augroup END

" Commit staged changes
cnoreabbrev gco Git commit

" Pushing changes commited
cnoreabbrev gpu Git push 

" Move between changes 
nnoremap <silent> <cr> :GitGutterNextHunk<cr>
nnoremap <silent> <backspace> :GitGutterPrevHunk<cr>

""""""""""""""""""""""" Commands for development

" Run test focus describe
cnoreabbrev td :call RunCmd('yarn jest --watch -t "' . GetDescribe() . '" ' . expand('%'), 0) 

" Run test focus it 
cnoreabbrev ti :call RunCmd('yarn jest --watch -t "' . GetFullDescribe() . '" ' . expand('%'), 0) 

" Run test in focus file   
cnoreabbrev te :call RunCmd('yarn jest --watch ' . expand('%'), 0) 

" Run test and coverage in focus file   
cnoreabbrev tc :call RunCmd('yarn test:coverage '  . expand('%'), 0) 

" Run test and coverage all files   
cnoreabbrev ta :call RunCmd('yarn test:coverage ', 0) 

" Open file test from current file
cnoreabbrev to :call FindTestFiles() 

" Run node app 
cnoreabbrev up :call RunCmd('yarn devel', 0) 

" Run node app in debug
cnoreabbrev dg :call RunCmd('node --inspect src/server/index.js', 0) 
