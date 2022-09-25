syntax on

set mouse=a
set numberwidth=2
set clipboard=unnamedplus
set noshowcmd
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
set foldlevelstart=99
set ignorecase
set diffopt+=vertical 
set nowrap
set rtp+=/usr/local/opt/fzf

set so=999
set relativenumber

language en_US.UTF-8

call plug#begin('~/vim/plugged')

"  Plug 'scrooloose/nerdtree'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'junegunn/fzf.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'

call plug#end()

so ~/.config/nvim/theme.vim
so ~/.config/nvim/config.vim
so ~/.config/nvim/maps.vim

