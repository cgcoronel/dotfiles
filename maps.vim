":help key-notation

" add console.log with the variable under cursor  
vnoremap L iwyoconsole.log(':::::::::::::::: <ESC>pa: ', <ESC>pa);<ESC>

""""""""""""""""""""""" Shortcuts
let mapleader = "\<space>"

" remap escape key in insert mode
imap jk <Esc>
imap kj <Esc>

" Duplicate a paragraph
noremap cp yap<S-}>p

"in insert mode add new line
imap oo <Esc>o

" remap escape key in command mode 
cmap jk <Esc>
cmap kj <Esc>

" remap got to definitions local
nnoremap fs gd 

" remap go to definition file, search firts occurrence, and search
" require('....
nmap ff :call search('\V' . '(')<CR> gf
"nmap ff gf

" show tree directories 
nmap <Leader>n :NERDTreeFind<CR>

" Save file 
nmap <Leader>w :w<CR>

" Save file without prettier format
cmap ww :noa w<CR>

" Quit
nmap <Leader>q :call CloseFile()<CR>

" Split vertical 
nmap <Leader>s :vsplit<CR>

" Finder
nmap <Leader>f :call fzf#run({'sink': 'e', 'down': '~20%'})<CR>

" Finder in files
nmap <Leader>F :Rg<CR>

" Search in file 
nmap <Leader>b :/
nmap <Leader>/ :/
 
" Git
nmap <Leader>c :Gdiffsplit<CR>
nmap <Leader>d :0Git<CR>
nmap <Leader>a :Gw<CR> 

"abbreviations from git commands
cnoreabbrev gpush Gpush
cnoreabbrev gstatus Gstatus
"cnoreabbrev gco Gco TODO
cnoreabbrev gco :echom 'you should use *cc* in fugitive!'  
cnoreabbrev gpull Gpull
cnoreabbrev gpu :call PushChanges() 

" Run test in focus file   
cnoreabbrev te :call RunTest() 

"cnoreabbrev gpu :!git push 
cnoreabbrev gst Gstatus
cnoreabbrev gpl Gpull

" Diagnostics
cnoreabbrev dia CocDiagnostics

" Command line 
"nmap <Leader>t :!
nmap <Leader>t :call OpenTerminal()<CR>
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

" Move focus between split screens
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Autocomplete parents pairs
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ` ``<Esc>i
inoremap ${ ${}<Esc>i
inoremap { {<CR>}<C-c>O

