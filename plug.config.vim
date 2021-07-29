""""""""""""""""""" Coc extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-snippets', 'coc-tabnine']
let g:coc_snippet_next = '<tab>'

""""""""""""""""""" fzf config
let g:fzf_layout = { 'down': '~40%' }
"let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6, 'highlight': 'Visual' } }

""""""""""""""""""" Theme params
"so $VIM/themes/native.vim
so $VIM/themes/gruvbox.vim
"so $VIM/themes/gruvbox-material.vim


""""""""""""""""""" NERDTree config
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['^node_modules$', '^.git$']
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 0
let NERDTreeCascadeOpenSingleChildDir = 1
let g:indentLine_bufNameExclude = ['NERD_tree.*']
let NERDTreeStatusline=' %{StatuslineGit()} %{StatuslineBranch()}'

"""""""""""""""""""IndentLine
let g:indentLine_char_list = [ '│']
autocmd Filetype json let g:indentLine_setConceal = 0
