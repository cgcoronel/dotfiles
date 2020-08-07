""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""
"  ViM Custom Setup
"
" by Cristian G. Coronel
""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""
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
set directory^=$HOME/.vim/swap//
set undofile
set undodir=~/.vim/undodir
set history=1000

""""""""""""""""""" Pluggins 
""""""""""""""""""""""""""""
call plug#begin('~/vim/plugged')

Plug 'joshdick/onedark.vim'						" Tema  
Plug 'neoclide/coc.nvim', {'branch': 'release'}				" Conque of Completion
Plug 'maxmellon/vim-jsx-pretty'						" React syntax
"Plug 'leafgarland/typescript-vim'					" Typescript syntax
"Plug 'peitalin/vim-jsx-typescript'					" React and typescript syntax	
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }    " Style Components syntax 
Plug 'pangloss/vim-javascript'						" Js syntax
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }			" Command line Fuzzy Finder
Plug 'junegunn/fzf.vim'							" Command line Fuzzy Finder
Plug 'scrooloose/nerdtree'						" NERDTree <3 <3 <3
Plug 'christoomey/vim-tmux-navigator'					" Tmux Navigator - move between split screens
Plug 'vim-airline/vim-airline'						" Airline Status bar / tabs
Plug 'vim-airline/vim-airline-themes'					" Airline Theme
Plug 'tpope/vim-fugitive'						" Fugitive - Git Manager
Plug 'terryma/vim-multiple-cursors'					" Multiple cursors
Plug 'ryanoasis/vim-devicons'						" Dev icons 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'				" Nerd icons syntax and file extensions

call plug#end()


""""""""""""""""""" Coc extensions 
""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-snippets', 'coc-pairs', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-emmet']

let g:coc_snippet_next = '<tab>'

""""""""""""""""""" Theme params 
""""""""""""""""""""""""""""""""

if has('termguicolors')
  set termguicolors
endif

" Atom Colors
let g:onedark_color_overrides = { 
\ "green": { "gui": "#8EC07C", "cterm": "170", "cterm16": "5" },
\ "purple": { "gui": "#C678DD", "cterm": "170", "cterm16": "5" },
\ "special_grey": { "gui": "#fff", "cterm": "170", "cterm16": "5" },
\ "blue": { "gui": "#729FCF", "cterm": "170", "cterm16": "5" },
\ "white": { "gui": "#ABB2BF", "cterm": "170", "cterm16": "5" },
\ "red": { "gui": "#E95F5B", "cterm": "170", "cterm16": "5" },
\ "black": { "gui": "#282C34", "cterm": "170", "cterm16": "5" },
\}

let g:onedark_hide_endofbuffer = 1 " hide ~
let g:onedark_terminal_italics = 1 
let g:onedark_termcolors = 256 
let g:airline_theme = 'onedark'

" Theme barra de estado y navegación
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1 
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

set guifont=DroidSansMono\ Nerd\ Font\ 11  

colorscheme onedark
set background=dark
hi VertSplit guibg=#23272E

"""""""""""""""" fin Tema

let mapleader = " "

" Desplega el arbol de directorios
nmap <Leader>n :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:NERDTreeIgnore= ['^node_modules$', '^.git$']

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

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Barra vertical
set fillchars+=vert:\ 


" 
" Instalacion
"
" correr desde vim:

":CocConfig
" Agregar el siguiente archivo y guardar
" {
"  "suggest.noselect": false,
"  "coc.preferences.formatOnSaveFiletypes": [
"    "javascript",
"    "typescript",
"    "typescriptreact",
"    "json",
"    "javascriptreact",
"    "typescript.tsx",
"    "graphql"
"  ]
" }

"sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


" correr desde la terminal
" descargar fuentes

"mkdir -p ~/.local/share/fonts
" cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
"

"Instalar las fuentes necesarias
"sudo apt-get install fonts-powerline

" Instalar finder
"  sudo apt install fd-find

