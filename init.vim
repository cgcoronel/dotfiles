syntax on

set mouse=a
set numberwidth=1
set clipboard=unnamedplus
set noshowcmd
set ruler
set cursorline
set encoding=UTF-8
set sw=2
set updatetime=100
set ttimeoutlen=50
set laststatus=2 	" Always show statusbar
set nowrap      	" don't wrap long lines
set number 		" show line numbers
set showmatch		" higlight matching parentheses and brackets
set history=1000 	" Increase history size
set autoindent		" autoindent always ON.
set directory=~/.vim/swap/

" Persist undo history between file editing sessions.
set undofile
set undodir=~/.vim/undodir/

set foldmethod=indent
set foldcolumn=0   
set foldlevelstart=99
set ignorecase
set diffopt+=vertical 

language en_US.UTF-8

""""""""""""""""""" Plugins
call plug#begin('~/vim/plugged')

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-gitgutter'

  "Plug 'preservim/nerdtree'
  "Plug 'sheerun/vim-polyglot'

call plug#end()

""""""""""""""""""" Imports custom plugins 
so ~/.config/nvim/plugins/close-buffer.vim
so ~/.config/nvim/plugins/push-changes.vim
so ~/.config/nvim/plugins/run-cmd.vim
so ~/.config/nvim/plugins/tests.vim
""so ~/.config/nvim/plugins/nerdtree.vim
so ~/.config/nvim/plugins/netrw.vim

""""""""""""""""""" Imports other configs
so ~/.config/nvim/plug-config.vim
so ~/.config/nvim/maps.vim
so ~/.config/nvim/theme.vim

""""""""""""""""""" Status line
set statusline+=%#StatusBar#\ %f\ %m 
