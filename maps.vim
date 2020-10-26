""""""""""""""""""""""" Shortcuts
let mapleader = "\<space>"

":help key-notation
" remap escape key in insert mode
imap jk <Esc>
imap kj <Esc>

" remap escape key in command mode 
cmap jk <Esc>
cmap kj <Esc>

" remap got to definitions local
nmap fs gd 

" remap go to definition file
nmap ff gf

" show tree directories 
nmap <Leader>n :NERDTreeFind<CR>

" Save file 
nmap <Leader>w :w<CR>

" Save file without prettier format
cmap ww :noa w<CR>

" Quit
" close each buffer and close vim 
function! Bye()
     if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
         :q 
     else
         :bdelete
     endif
endfunction

nmap <Leader>q :call Bye()<CR>

" Next Tab (Space + Tab)
"nmap <Leader>	 :bnext<CR>

" Split vertical 
nmap <Leader>s :vsplit<CR>

" Finder
nmap <Leader>f :Files<CR>

" Finder in files
nmap <Leader>F :Rg<CR>

" Search in file 
nmap <Leader>b :/
 
" Git
nmap <Leader>c :Gdiffsplit<CR>
nmap <Leader>d :0Git<CR>
nmap <Leader>a :Gw<CR> 

"abbreviations from git commands
cnoreabbrev gpush Gpush
cnoreabbrev gstatus Gstatus
cnoreabbrev gco Gco
cnoreabbrev gpull Gpull

cnoreabbrev gpu Gpush
cnoreabbrev gst Gstatus
cnoreabbrev gpl Gpull

" Diagnostics
cnoreabbrev dia CocDiagnostics

" Command line 
nmap <Leader>t :!
map <Leader>; : 

" Command find and replace
command! -nargs=+ Replace :%s/<args>/gc
cnoreabbrev replace Replace

" list files opened 
nmap <Leader>p :Buffers<CR>

"Ctrl + [ h,j, k, l ] move the cursor on insert mode 
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Move 
nnoremap gl $
nnoremap gh 0
nnoremap gk H
nnoremap gj L

vnoremap gl $
vnoremap gh 0
vnoremap gk H
vnoremap gj L

