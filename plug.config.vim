""""""""""""""""""" Coc extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-snippets']
let g:coc_snippet_next = '<tab>'

""""""""""""""""""" fzf config
let g:fzf_layout = { 'down': '~40%' }

""""""""""""""""""" Theme params
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'

colorscheme gruvbox
set background=dark

""""""""""""""""""" NERDTree config
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['^node_modules$', '^.git$']
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 0
let NERDTreeCascadeOpenSingleChildDir = 1
let g:indentLine_bufNameExclude = ['NERD_tree.*']
