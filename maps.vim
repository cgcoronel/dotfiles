":help key-notation

""""""""""""""""""""""" Shortcuts
let mapleader = "\<space>"

" Clean search result
nnoremap <Leader><space> :noh<cr>

" remap escape key in insert mode
imap jk <Esc>
imap kj <Esc>

" remap escape key in command mode 
cmap jk <Esc>
cmap kj <Esc>

" Command line 
map <Leader>t :call RunCmd()<CR> 

map <Leader>; : 

" Split vertical 
nmap <Leader>s :vsplit<CR>

" remap got to definitions local
nnoremap fs gd

" remap go to definition file, search firts occurrence, and search
" require('....
nmap ff :call search('\V' . '(')<CR> gf
nmap fd gf

" show tree directories 
nmap <Leader>n :NERDTreeFind<CR>

" Save file 
nmap <Leader>w :w<CR>

" Save file without prettier format
cmap ww :noa w<CR>

" Quit
nmap <Leader>q :call CloseFile()<CR>
vmap <Leader>q :call CloseFile()<CR>

" Command find and replace
command! -nargs=+ Replace :%s/<args>/gc
cnoreabbrev replace Replace

" List files opened 
nmap <Leader>p :call fzf#vim#buffers({'down': '~15%' })<CR>

" Finder
nmap <Leader>f :call fzf#run({'sink': 'e', 'down': '~20%', 'options': ['-i']})<CR>
"nmap <Leader>f :Files<CR>

" Finder in files
nmap <Leader>F :Rg<CR>

" Search in file 
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

" Git move between changes 
nnoremap <silent> <cr> :GitGutterNextHunk<cr>
nnoremap <silent> <backspace> :GitGutterPrevHunk<cr>

" git checkout -b branch_name
command! -nargs=* Gc :!git checkout <args>
cnoreabbrev gc Gc

command! -nargs=* Gcb :!git checkout -b <args>
cnoreabbrev gcb Gcb

" Run test focus describe
cnoreabbrev td :call RunCmd('yarn jest --watch -t "' . GetDescribe() . '" ' . expand('%'), 0) 
" Run test focus it 
cnoreabbrev ti :call RunCmd('yarn jest --watch -t "' . GetFullName() . '" ' . expand('%'), 0) 
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

"cnoreabbrev gpu :!git push 
cnoreabbrev gst Gstatus
cnoreabbrev gpl Gpull

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
""map <C-J> <Esc><C-W><C-J>
""map <C-K> <Esc><C-W><C-K>
map <C-L> <Esc><C-W><C-L>
map <C-H> <Esc><C-W><C-H>

""imap <C-J> <Esc><C-W><C-J>
""imap <C-K> <Esc><C-W><C-K>
imap <C-L> <Esc><C-W><C-L>
imap <C-H> <Esc><C-W><C-H>

nnoremap <Leader>, 10<C-w><
nnoremap <Leader>. 10<C-w>>

" Toggle relativenumber
map <C-N> :set relativenumber!<CR>

map <C-J> 10j
map <C-K> 10k

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


