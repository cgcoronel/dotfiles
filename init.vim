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

""set foldmethod=syntax " syntax highlighting items specify folds
set foldmethod=indent
set foldcolumn=0      " defines 1 col at window left, to indicate folding
set foldlevelstart=99 " start file with all folds opened
set ignorecase
language en_US.UTF-8

""""""""""""""""""" Plugins
call plug#begin('~/vim/plugged')

  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  ""Plug 'sainnhe/gruvbox-material'
  ""Plug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'Yggdroot/indentLine'
  Plug 'APZelos/blamer.nvim'
""  Plug 'mxw/vim-jsx'

call plug#end()

let $VIM = '~/.config/nvim/'
let $PLUGINS =$VIM . 'plugins/**/*.vim'

""""""""""""""""""" Imports cunstom plugins 
for f in glob($PLUGINS, 0, 1)
  execute 'source' f
endfor

""""""""""""""""""" Config 
so $VIM/plug.config.vim

""""""""""""""""""" Imports shortcuts
so $VIM/maps.vim
