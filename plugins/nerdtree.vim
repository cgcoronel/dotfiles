""""""""""""""""""" NERDTree config
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['^node_modules$', '^.git$']
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 1
let NERDTreeCascadeOpenSingleChildDir = 1
let g:indentLine_bufNameExclude = ['NERD_tree.*']
let NERDTreeStatusline= ' '
let g:NERDTreeWinSize= 40

" add plug
"Plug 'preservim/nerdtree'

"add import
"so ~/.config/nvim/plugins/nerdtree.vim


" Open file explorer NERDTree
""nmap <silent> <Leader>e :buffer NERD_tree_1<CR>
""nmap <silent> <Leader>n :NERDTreeFind<CR>

" Finder
""nmap <Leader>f :call fzf#run({'sink': 'e', 'down': '~25%', 'options': ['-i']})<CR>

" Seach word into files
""nmap ? :Rg<CR>

