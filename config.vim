" Coc
let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-json']
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:coc_node_path = '/Users/cristiancoronel/node-v18.17.0/bin/node'

" fzf config
let g:fzf_action = { 'ctrl-o': 'vsplit' }
let g:fzf_colors = { 'border': ['fg', 'Conceal'], 'bg+': ['bg', 'Visual' ] }
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }

" Git Gutter - Only show signs when saving file
autocmd BufWritePost * GitGutter

let g:gitgutter_highlight_linenrs = 0 
let g:gitgutter_map_keys = 0

" fugitive
let g:fugitive_dynamic_colors = 0 

" Netrw 
let g:netrw_keepdir = 1
let g:netrw_altv = 1
let g:netrw_list_hide = '.*\.DS_Store,.\.vscode,node_modules'
let g:netrw_hide = 1       
let g:netrw_fastbrowse = 0
let g:netrw_bufsettings = 'nonu noma nomod nobl nowrap ro'
let g:netrw_banner = 0

function! CopyFile()
  let file = expand("%:p") . netrw#Call('NetrwGetWord')
  let newfile = input('Copy file: ', file)
  silent execute '!cp' file newfile
endfunction

hi! link netrwMarkFile Search
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
  autocmd fileType netrw setl bufhidden=wipe
augroup END

function! NetrwMapping() abort
  setlocal nocursorline
  nmap <buffer> <nowait> c :call CopyFile()<CR>
  nmap <buffer> <nowait> o <CR>
  nmap <buffer> <nowait> p -
  nmap <buffer> <nowait> a %
  nmap <buffer> <nowait> s v<C-h>
  nmap <buffer> <nowait> . :bnext<CR>
  nmap <buffer> <nowait> m :bprevious<CR>
endfunction


" Term
function! TerminalMappings()
  startinsert
  setlocal nonu nornu
  tnoremap <buffer> <leader>q <C-\><C-n>:bd!<CR>
  tnoremap <buffer> <c-h> <C-\><C-n><C-w><C-h>
  tnoremap <buffer> <c-l> <C-\><C-n><C-w><C-l>
  tnoremap <buffer> <esc><esc> <C-\><C-n><C-w>j
endfunction

autocmd TermOpen term://*zsh call TerminalMappings()
autocmd TermOpen term://*npx* call TerminalMappings()
autocmd BufEnter term://* startinsert

" Github Copilot
 let g:copilot_node_command = "~/node-v18.17.0/bin/node"
 let g:copilot_filetypes = {
     \ 'gitcommit': v:true,
     \ 'markdown': v:true,
     \ 'yaml': v:true
     \ }
" Theme
colorscheme tokyonight-night

hi GitGutterAdd guifg=#545c7e 
hi GitGutterChange guifg=#545c7e 
hi GitGutterDelete guifg=#545c7e
hi GitGutterChangeDelete guifg=#545c7e
hi DiagnosticError guifg=#545c7e

hi TelescopeNormal guibg=0
hi TelescopeBorder guibg=0

" Bufferline
lua << EOF
require("bufferline").setup{
  options = {
   custom_filter = function(buf_number, buf_numbers)
        if vim.bo[buf_number].filetype ~= "netrw" then
	  return true
        end
   end,
   offsets = {
      {
        filetype = "netrw",
        text = "Netrw",
        highlight = "Directory",
        text_align = "left",
      },
    },
  }
}
require('flit').setup{
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  labeled_modes = "v",
  multiline = true,
  opts = {}
}

require("telescope").setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "ignore_case",
    },
  },
})
require("telescope").load_extension("fzf")

require("illuminate").configure({
  delay = 200,
  large_file_cutoff = 2000,
})
EOF
