""""""""""""""""""" Coc extensions
let g:coc_global_extensions = [ 'coc-prettier', 'coc-tsserver', 'coc-eslint' ] " 'coc-tabnine' ]
let g:coc_snippet_next = '<tab>'

""""""""""""""""""" fzf config
""let g:fzf_layout = { 'down': '~40%' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

let g:fzf_action = { 'ctrl-o': 'vsplit' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'Pmenu'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'spinner': ['fg', 'Label'] }

""""""""""""""""""" IndentLine
autocmd Filetype json let g:indentLine_setConceal = 0
""let g:indentLine_char_list = ['|'] 
let g:indentLine_char_list = ['│'] 
let g:indentLine_color_term = 8 
let g:indentLine_fileTypeExclude = ["help"]
let g:indentLine_bufTypeExclude = ["help"]
let g:indentLine_indentLevel = 5 

""""""""""""""""""" Vim Git Gutter 
" Only show signs when save file
autocmd BufWritePost * GitGutter
let g:gitgutter_highlight_linenrs = 0 
let g:gitgutter_map_keys = 0

""""""""""""""""""" Vim Fugitive
let g:fugitive_dynamic_colors = 0 

""""""""""""""""""" Simple terminal
let g:simple_term_close = '<Leader>q' 

""""""""""""""""""" NERDTree config
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['^node_modules$', '^.git$']
let NERDTreeMinimalUI = 1
let NERDTreeMinimalMenu = 1
let NERDTreeCascadeOpenSingleChildDir = 1
let NERDTreeStatusline= ' '
let NERDTreeDirArrowExpandable = '' 
let NERDTreeDirArrowCollapsible = ''
let NERDTreeWinSize= 40
let g:indentLine_bufNameExclude = ['NERD_tree.*']

""""""""""""""""""" Netrw config
let g:netrw_banner = 0

""""""""""""""""""" Buffer list
function! BufferList(p = 'n')
    if a:p == 'n'  
      :silent bnext
    else
      :silent bprevious
    endif

    let l:blist = getbufinfo()
    let bar = 'Buf> '

    for l:item in l:blist
        let name = ''
        let array = split(l:item.name, '/')
      
        if l:item.listed == 0 
          continue
        endif

        if len(array) > 0 || index(tabpagebuflist(), l:item.bufnr) > 0 
          let name = array[-1]
        else
          continue
        endif  

        if name == 'NERD_tree_1' || name == 'index'
          continue
        endif

        if expand('%:t') == name
          let bar = bar . '[' . name . ']'
        else
          let bar = bar . ' ' . name . ' '
        endif
    endfor

    echo bar 
endfunction
