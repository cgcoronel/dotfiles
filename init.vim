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
set foldcolumn=0   
set foldlevelstart=99
set ignorecase
set diffopt+=vertical 
set nowrap

language en_US.UTF-8

""""""""""""""""""" Plugins
call plug#begin('~/vim/plugged')

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'
  Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale'

call plug#end()

""""""""""""""""""" Imports custom plugins 
so ~/.config/nvim/plugins/close-buffer.vim
so ~/.config/nvim/plugins/run-cmd.vim
so ~/.config/nvim/plugins/tests.vim
so ~/.config/nvim/plugins/netrw.vim

""""""""""""""""""" Imports other configs
so ~/.config/nvim/plug-config.vim
so ~/.config/nvim/maps.vim
so ~/.config/nvim/theme.vim

""""""""""""""""""" Status line
set statusline+=\ %F\ %M 
