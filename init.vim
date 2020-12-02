syntax on
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
set noshowcmd
set ruler
set cursorline
set encoding=UTF-8
set showmatch
set sw=2
set number "relativenumber
set laststatus=2
set updatetime=100
set ttimeoutlen=50
set directory=~/.vim/swap/
set undofile
set undodir=~/.vim/undodir/
set history=1000
set autoindent

set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=0 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

language en_US.UTF-8

""""""""""""""""""" Imports shortcuts
so ~/.config/nvim/maps.vim

""""""""""""""""""" Plugins
call plug#begin('~/vim/plugged')

  Plug 'morhetz/gruvbox'				" Theme
  Plug 'neoclide/coc.nvim', {'branch': 'release'}	" Conque of Completion
  "Plug 'maxmellon/vim-jsx-pretty'			" React syntax
  Plug 'pangloss/vim-javascript'			" Js syntax
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" Command line Fuzzy Finder
  Plug 'junegunn/fzf.vim'				" Command line Fuzzy Finder
  Plug 'scrooloose/nerdtree'				" NERDTree <3 <3 <3
  Plug 'christoomey/vim-tmux-navigator'			" Tmux Navigator - move between split screens
  Plug 'tpope/vim-fugitive'				" Fugitive - Git Manager
  Plug 'airblade/vim-gitgutter'				" Git Gutter
  Plug 'Yggdroot/indentLine'				" Ident Line |
  Plug 'jiangmiao/auto-pairs'                           " Autocomplete pairs [{()}]

call plug#end()

"""""""""""""""" Custom status bar
function! StatuslineGit()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0?l:branchname:''
endfunction

set statusline+=%#StatusBar#\ %f\ \ %m

" Right side settings
set statusline+=%=\ %{StatuslineGit()} 
set statusline+=\ %l/%L,%c\ 

""""""""""""""""""" Coc extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json' ]
let g:coc_snippet_next = '<tab>'

""""""""""""""""""" fzf config
let g:fzf_layout = { 'down': '~40%' }

""""""""""""""""""" Theme params
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'

colorscheme gruvbox
set background=dark

" Imports colors
so ~/.config/nvim/colors.vim

""""""""""""""""""" NERDTree config
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['^node_modules$', '^.git$']
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 0
let NERDTreeCascadeOpenSingleChildDir = 1
let g:indentLine_bufNameExclude = ['NERD_tree.*']

