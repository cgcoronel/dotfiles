syntax on

set mouse=a
set numberwidth=1
set clipboard=unnamedplus
set noshowcmd
set noruler
set cursorline
set encoding=UTF-8
set showmatch
set sw=2
set number
set laststatus=2
set updatetime=100
set ttimeoutlen=50
set directory=~/.vim/swap/
set undofile
set undodir=~/.vim/undodir/
set history=1000
set autoindent
set foldmethod=indent
set foldcolumn=2  
set foldlevelstart=99
set ignorecase
set diffopt+=vertical 
set nowrap

set fillchars=eob:\ 
""set fillchars+=vert:\ 

language en_US.UTF-8

""""""""""""""""""" Plugins
call plug#begin('~/vim/plugged')

  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind'}
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'
  Plug 'sheerun/vim-polyglot'
  Plug 'voldikss/vim-floaterm'
  Plug 'cgcoronel/simple-term.vim'
  Plug 'cgcoronel/simple-bufferline.vim'

call plug#end()

""""""""""""""""""" Imports custom plugins 
so ~/.config/nvim/test.vim

""""""""""""""""""" theme
color peachpuff
so ~/.config/nvim/theme.vim

""""""""""""""""""" Imports other configs
so ~/.config/nvim/config.vim
so ~/.config/nvim/maps.vim

""""""""""""""""""" Status line
function! Project() abort
  return substitute(getcwd(), '^.*/', '', '')
endfunction

set statusline=\ \ \ \ \ \ %#StatusLine#%{Project()}\/%{@%}\ %m
