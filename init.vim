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

set foldmethod=syntax " syntax highlighting items specify folds
set foldcolumn=0      " defines 1 col at window left, to indicate folding
set foldlevelstart=99 " start file with all folds opened

language en_US.UTF-8

""""""""""""""""""" Plugins
call plug#begin('~/vim/plugged')

  Plug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'Yggdroot/indentLine'

call plug#end()


""""""""""""""""""" Imports functions 
so ~/.config/nvim/functions.vim

""""""""""""""""""" Imports shortcuts
so ~/.config/nvim/maps.vim

""""""""""""""""""" Plugins config 
so ~/.config/nvim/plug.config.vim

""""""""""""""""""" Imports custom colors
so ~/.config/nvim/colors.vim


"""""""""""""""" Custom status bar

set statusline+=%#StatusBar#\ %f\ \ %m

" Right side settings
set statusline+=%=\ %{StatuslineGit()} 
set statusline+=\ %l/%L,%c\ 



