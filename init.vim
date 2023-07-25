syntax on

set mouse=a
set clipboard=unnamedplus
set encoding=UTF-8
set showmatch
set number relativenumber
set sw=2
set ttimeoutlen=0
set undofile
set history=1000
set autoindent
set foldmethod=indent
set foldlevelstart=99
set ignorecase
set nowrap
set hidden
set so=999
set rtp+=~/.config/nvim/plugged/*,/opt/homebrew/opt/fzf

""so ~/.config/nvim/theme.vim
so ~/.config/nvim/config.vim
so ~/.config/nvim/maps.vim

colorscheme tokyonight-night

" GitGutter
hi GitGutterAdd guifg=#545c7e 
hi GitGutterChange guifg=#545c7e 
hi GitGutterDelete guifg=#545c7e
hi GitGutterChangeDelete guifg=#545c7e

hi DiagnosticError guifg=#545c7e

 let g:copilot_node_command =
  \ "~/node-v18.17.0/bin/node"
