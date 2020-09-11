syntax on 
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
set showcmd
set ruler
set cursorline
set encoding=UTF-8
set showmatch
set sw=2
set number relativenumber
set laststatus=2
set noshowmode
set updatetime=100
set ttimeoutlen=50
set directory=~/.vim/swap/
set undofile
set undodir=~/.vim/undodir/
set history=1000
set t_Co=256

""""""""""""""""""" Plugins 
call plug#begin('~/vim/plugged')

Plug 'morhetz/gruvbox'					" Theme 
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" Conque of Completion
Plug 'maxmellon/vim-jsx-pretty'				" React syntax
Plug 'pangloss/vim-javascript'				" Js syntax
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" Command line Fuzzy Finder
Plug 'junegunn/fzf.vim'					" Command line Fuzzy Finder
Plug 'scrooloose/nerdtree'				" NERDTree <3 <3 <3
Plug 'christoomey/vim-tmux-navigator'			" Tmux Navigator - move between split screens
Plug 'tpope/vim-fugitive'				" Fugitive - Git Manager
Plug 'airblade/vim-gitgutter'				" Git Gutter

call plug#end()


"""""""""""""""" Custom status bar
function! StatuslineGit()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0?'  ⎇  '.l:branchname.' ':''
endfunction

" mode
let ctrlv = "\<C-v>"
set statusline+=%#QuickFixLine#%{(mode()==ctrlv)?'\ \ VISUAL\ BLOCK\ ':''}
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#PmenuSel#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#Search#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#QuickFixLine#%{(mode()=='t')?'\ \ TERMINAL\ ':''}

set statusline+=%#FoldColumn#
set statusline+=\ %f\ %m

set statusline+=%= " Right side settings
set statusline+=%{StatuslineGit()} " git branch

" info file
set statusline+=\ %#PmenuThumb#
set statusline+=\ \ \ %p%%
set statusline+=\ \ \ Ξ
set statusline+=\ %l/%L
set statusline+=\ \ \ ㏑:
set statusline+=%c
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} 
set statusline+=\  


""""""""""""""""""" Coc extensions 
let g:coc_global_extensions = ['coc-snippets', 'coc-pairs', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-emmet']
let g:coc_snippet_next = '<tab>'


""""""""""""""""""" Theme params 
let g:gruvbox_italic=1

colorscheme gruvbox
set background=dark
hi PmenuThumb gui=bold ctermfg=124 ctermfg=black
hi GruvboxGreenBold gui=none ctermfg=124 ctermfg=green

let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeIgnore= ['^node_modules$', '^.git$']
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 0
let NERDTreeCascadeOpenSingleChildDir = 1


""""""""""""""""""""""" Shortcuts
let mapleader = " "

":help key-notation
" remap tecla escape
imap jk <Esc>
imap kj <Esc>

" Desplega el arbol de directorios
nmap <Leader>n :NERDTreeFind<CR>

" Save file 
nmap <Leader>w :w<CR>

" Quit
" cierra cada buffer y cuando llega al ultimo buffer cierra vim 
function! Bye()
     if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
         :q 
     else
         :bdelete
     endif
endfunction

nmap <Leader>q :call Bye()<CR>

" Next Tab (Space + Tab)
nmap <Leader>	 :bnext<CR>

" Split vertical 
nmap <Leader>s :vsplit<CR>

" Finder
nmap <Leader>f :GFiles<CR>
      
" Search in file 
nmap <Leader>b :/
      
" Git
nmap <Leader>c :Gdiff<CR>
nmap <Leader>d :G<CR>
nmap <Leader>a :Gw<CR> 

" Command line 
nmap <Leader>t :!

" list files opened 
nmap <Leader>p :Buffers<CR>

" Move lines with Alt + [ j | l ] o Alt + [Up | Down ] 
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi

" Move 
nnoremap gl $
nnoremap gh 0
nnoremap gk H
nnoremap gj L

vnoremap gl $
vnoremap gh 0
vnoremap gk H
vnoremap gj L

