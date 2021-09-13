":help key-notation

""""""""""""""""""""""" Shortcuts
let mapleader = "\<space>"

" Clean search result
nnoremap <Leader><space> :noh<cr>

" remap escape key in insert mode
imap jk <Esc>
imap kj <Esc>

" Duplicate a paragraph
noremap cp yap<S-}>p

" remap escape key in command mode 
cmap jk <Esc>
cmap kj <Esc>

" remap got to definitions local
nnoremap fs gd

" remap go to definition file, search firts occurrence, and search
" require('....
nmap ff :call search('\V' . '(')<CR> gf
nmap fd gf

" Zen mode
nmap <Leader>g :Goyo<CR>

" show tree directories 
nmap <Leader>n :NERDTreeFind<CR>

" Save file 
nmap <Leader>w :w<CR>

" Save file without prettier format
cmap ww :noa w<CR>

" Quit
nmap <Leader>q :call CloseFile()<CR>
vmap <Leader>q :call CloseFile()<CR>

" Split vertical 
nmap <Leader>s :vsplit<CR>

" Finder
nmap <Leader>f :call fzf#run({'sink': 'e', 'down': '~20%'})<CR>
"nmap <Leader>f :Files<CR>

" Finder in files
nmap <Leader>F :Rg<CR>

" Search in file 
nmap <Leader>b :/
nmap <Leader>/ :/
 
" Git
nmap <Leader>c :Gdiffsplit<CR>
nmap <Leader>d :0Git<CR>

"abbreviations from git commands
cnoreabbrev gpush Gpush
cnoreabbrev gstatus Gstatus
cnoreabbrev gco Git commit
cnoreabbrev gpull Gpull
cnoreabbrev gpu :call PushChanges() 
cnoreabbrev gs :echo StatuslineGit()

" git checkout -b branch_name
command! -nargs=* Gc :!git checkout <args>
cnoreabbrev gc Gc

command! -nargs=* Gcb :!git checkout -b <args>
cnoreabbrev gcb Gcb

" Run test in focus file   
cnoreabbrev te :call RunCommand('yarn jest --watch ' . expand('%'), 0) 
" Run test and coverage in focus file   
cnoreabbrev tc :call RunCommand('yarn test:coverage '  . expand('%'), 0) 
" Run test and coverage all files   
cnoreabbrev ta :call RunCommand('yarn test:coverage ', 0) 
" Open file test from current file
cnoreabbrev to :call FindTestFiles() 


" Open version monitor
cnoreabbrev up :call RunCommand('yarn devel', 0) 
cnoreabbrev dg :call RunCommand('node --inspect src/server/index.js', 0) 

"cnoreabbrev gpu :!git push 
cnoreabbrev gst Gstatus
cnoreabbrev gpl Gpull

" Command line 
nmap <Leader>t :!
"map <Leader>t :call RunCommand('')<CR> 

map <Leader>; : 

" Command find and replace
command! -nargs=+ Replace :%s/<args>/gc
cnoreabbrev replace Replace

" List files opened 
nmap <Leader>p :Buffers<CR>

" Move 
nnoremap gl $
nnoremap gh 0
nnoremap gk H
nnoremap gj L

vnoremap gl $
vnoremap gh 0
vnoremap gk H
vnoremap gj L

" Select all text
nnoremap <Leader>a <Esc>ggVG<CR>

" Move focus between split screens
map <C-J> <Esc><C-W><C-J>
map <C-K> <Esc><C-W><C-K>
map <C-L> <Esc><C-W><C-L>
map <C-H> <Esc><C-W><C-H>

imap <C-J> <Esc><C-W><C-J>
imap <C-K> <Esc><C-W><C-K>
imap <C-L> <Esc><C-W><C-L>
imap <C-H> <Esc><C-W><C-H>

" Autocomplete parents pairs
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ` ``<Esc>i
inoremap ${ ${}<Esc>i
""inoremap { {<CR>}<C-c>O
inoremap { {}<Esc>i

inoremap /f /*<Esc>
inoremap f/ */<Esc>
inoremap /d ()<Esc>i
inoremap /s []<Esc>i
""inoremap /a {<CR>}<C-c>O
inoremap /a {}<Esc>i

nnoremap <Leader>, 10<C-w>>
nnoremap <Leader>. 10<C-w><

" Toggle relativenumber
map <C-N> :set relativenumber!<CR>

map <C-J> 10j
map <C-K> 10k

"Move lines up / down
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
