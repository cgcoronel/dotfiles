"""""""""""""""""""""""""""""""""""""""""
""""""""""""""""  ViM Custom Setup for js
"""""""""""""""""" by Cristian G. Coronel 
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""
call plug#begin('~/vim/plugged')

Plug 'morhetz/gruvbox'							" Theme 
Plug 'neoclide/coc.nvim', {'branch': 'release'}				" Conque of Completion
Plug 'maxmellon/vim-jsx-pretty'						" React syntax
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }    " Style Components syntax 
Plug 'pangloss/vim-javascript'						" Js syntax
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }			" Command line Fuzzy Finder
Plug 'junegunn/fzf.vim'							" Command line Fuzzy Finder
Plug 'scrooloose/nerdtree'						" NERDTree <3 <3 <3
Plug 'christoomey/vim-tmux-navigator'					" Tmux Navigator - move between split screens
Plug 'tpope/vim-fugitive'						" Fugitive - Git Manager
Plug 'terryma/vim-multiple-cursors'					" Multiple cursors
Plug 'ryanoasis/vim-devicons'						" Dev icons 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'				" Nerd icons syntax and file extensions
Plug 'Xuyuanp/nerdtree-git-plugin'                                      " Icons git status for NERDTree
Plug 'gko/vim-coloresque'					   	" Coloresque

call plug#end()



"""""""""""""""""""" File path tab line
"""""""""""""""""""""""""""""""""""""""

set showtabline=2

function! FilePathLine() 
   return (&modified ? '%#DiffDelete#' : '%#FoldColumn#') 
          \. ' '
          \. WebDevIconsGetFileTypeSymbol()
          \. '  '
	  \. expand('%f') 
          \. ' '
	  \. '%#Pmenu#'  
endfunction
set tabline=%!FilePathLine()



"""""""""""""""" Custom status bar
""""""""""""""""""""""""""""""""""

function! StatuslineGit()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0?'  ⎇  '.l:branchname.' ':''
endfunction

" mode
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#PmenuSel#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#Search#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#QuickFixLine#%{(mode()=='t')?'\ \ TERMINAL\ ':''}

set statusline+=%#FoldColumn#
set statusline+=\ %t

" filetype
set statusline+=%= " Right side settings

" git branch
set statusline+=%{StatuslineGit()}
" info file
set statusline+=\ %#PmenuThumb#
"set statusline+=\ %#TermCursor#
set statusline+=\ %{WebDevIconsGetFileTypeSymbol()}
set statusline+=\ \ \ %p%%
set statusline+=\ \ \ Ξ
set statusline+=\ %l/%L
set statusline+=\ \ \ ㏑:
set statusline+=%c
set statusline+=\ %#DiffAdd#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} 
set statusline+=\  


""""""""""""""""""" Coc extensions 
""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-snippets', 'coc-pairs', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-emmet']

let g:coc_snippet_next = '<tab>'



""""""""""""""""""" Theme params 
""""""""""""""""""""""""""""""""

"if has('termguicolors')
"  set termguicolors
"endif

let g:gruvbox_italic=1

colorscheme gruvbox
set background=dark
hi VertSplit guibg=#3A3A3A
hi PmenuThumb gui=bold ctermfg=124 ctermfg=black
hi GruvboxGreenBold gui=bold ctermfg=124 ctermfg=green

" Iconos para git
let g:NERDTreeGitStatusIndicatorMapCustom = {
  \ 'Modified'  :'✹',
  \ 'Staged'    :'✚',
  \ 'Untracked' :'✭',
  \ 'Renamed'   :'➜',
  \ 'Unmerged'  :'═',
  \ 'Deleted'   :'✖',
  \ 'Ignored'   :'☒',
  \ 'Clean'     :'✔︎',
  \ 'Dirty'     :'!',
  \ 'Unknown'   :'?',
 \ }


let mapleader = " "

let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeIgnore= ['^node_modules$', '^.git$']
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 0
let NERDTreeCascadeOpenSingleChildDir = 1

" Barra vertical
set fillchars+=vert:\ 

"""""" Fin tema



""""""""""""""""""""""" Shortcuts
"""""""""""""""""""""""""""""""""

" Desplega el arbol de directorios
nmap <Leader>n :NERDTreeFind<CR>

" Guarda
nmap <Leader>w :w<CR>

" Salir
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
      
" Busqueda en un archivo
nmap <Leader>b :/
      
" Comparar cambios git
nmap <Leader>c :Gdiff<CR>
nmap <Leader>d :G<CR>
nmap <Leader>a :Gw<CR> 

" Linea de comandos
nmap <Leader>t :!

" filtrar archivos abiertos
nmap <Leader>p :Buffers<CR>

" Move lines con Alt + [ j | l ] o Alt + [Up | Down ] 
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Moverse a los extermos de la vista del editor
nnoremap gl $
nnoremap gh 0
nnoremap gk H
nnoremap gj L

vnoremap gl $
vnoremap gh 0
vnoremap gk H
vnoremap gj L

"nnoremap <Up> :resize +2<CR>
"nnoremap <Down> :resize -2<CR>
"nnoremap <Left> :vertical resize +2<CR>
"nnoremap <Right> :vertical resize -2<CR>

