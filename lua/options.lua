-- global options
vim.g.mapleader = " "

vim.o.mouse = "a"
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.showmode = true

vim.g.netrw_banner = 0
vim.cmd([[
  set encoding=UTF-8
  set sw=2
  set ttimeoutlen=0
  set undofile
  set history=1000
  set autoindent
  set foldmethod=indent
  set foldlevelstart=99
  set ignorecase
  set hidden
  set so=999
  set laststatus=0
  set expandtab
  hi TelescopeNormal guibg=0
  hi TelescopeBorder guibg=0
  hi NeoTreeNormal guibg=0
  hi NeoTreeNormalNC guibg=0
]])

-- Configuración específica para el plugin "copilot.nvim"
--vim.cmd('let g:copilot_node_command = "~/node-v18.17.0/bin/node"')
-- vim.cmd([[
-- let g:copilot_filetypes = {
--   \ 'gitcommit': v:true,
--   \ 'markdown': v:true,
--   \ 'yaml': v:true
--   \ }

vim.cmd([[
function! TerminalMappings()
  startinsert
  setlocal nonu nornu
  tnoremap <buffer> <leader>q <C-\><C-n>:bd!<CR>
  tnoremap <buffer> <c-h> <C-\><C-n><C-w><C-h>
  tnoremap <buffer> <c-l> <C-\><C-n><C-w><C-l>
endfunction

autocmd TermOpen term://*zsh call TerminalMappings()
autocmd TermOpen term://*npx* call TerminalMappings()
autocmd BufEnter term://* startinsert
]])
