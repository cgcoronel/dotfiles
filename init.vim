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

language en_US.UTF-8

""""""""""""""""""" Plugins
call plug#begin('~/vim/plugged')

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sheerun/vim-polyglot'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'Yggdroot/indentLine'
  Plug 'APZelos/blamer.nvim'
  Plug 'airblade/vim-gitgutter'

call plug#end()

let $VIM = '~/.config/nvim/'
let $PLUGINS =$VIM . 'plugins/**/*.vim'

""""""""""""""""""" Imports custom plugins 
for f in glob($PLUGINS, 0, 1)
  execute 'source' f
endfor

so $VIM/plug-config.vim
so $VIM/maps.vim
so $VIM/theme.vim

""""""""""""""""""" Status line
set statusline+=%#StatusBar#\ %f\ %m 
"%=\ %l/%L,%c\ 
