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

call plug#end()

let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']

"""""""""""""""" Custom status bar
function! StatuslineGit()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0?l:branchname:''
endfunction

set statusline+=%#StatusFileBar#
set statusline+=\ %f\ 
set statusline+=%#StatusFileBar#
set statusline+=\ %m

" Right side settings
set statusline+=%=
set statusline+=\ %{StatuslineGit()} " git branch
set statusline+=\ %l/%L,%c\ \  

""""""""""""""""""" Coc extensions 
let g:coc_global_extensions = ['coc-snippets', 'coc-pairs', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-emmet']
let g:coc_snippet_next = '<tab>'

""""""""""""""""""" fzf config
let g:fzf_layout = { 'down': '~40%' }

""""""""""""""""""" Theme params 
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'

colorscheme gruvbox
set background=dark
so ~/.config/nvim/colors.vim

let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeIgnore= ['^node_modules$', '^.git$']
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 0
let NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeStatusline ='%#StatusFileBar#'
