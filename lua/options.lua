local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = false
opt.signcolumn = "yes"
opt.termguicolors = true
opt.wrap = false

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

opt.lazyredraw = true
opt.updatetime = 250
opt.timeoutlen = 400

opt.undofile = true
opt.backup = false
opt.writebackup = false

opt.clipboard = "unnamedplus"
opt.ttimeoutlen = 0

vim.cmd([[
let g:minimal_italic_functions = 1
let g:minimal_transparent_background = 1 
]])

-- vim.cmd([[
-- function! TerminalMappings()
--   startinsert
--   setlocal nonu nornu
--   tnoremap <buffer> <leader>q <C-\><C-n>:bd!<CR>
--   tnoremap <buffer> <c-h> <C-\><C-n><C-w><C-h>
--   tnoremap <buffer> <c-l> <C-\><C-n><C-w><C-l>
--   tnoremap <buffer> <c-k> <C-\><C-n><C-w><C-k>
--   tnoremap <buffer> <c-j> <C-\><C-n><C-w><C-j>
-- endfunction
--
-- autocmd TermOpen term://*zsh call TerminalMappings()
-- autocmd TermOpen term://*npx* call TerminalMappings()
-- autocmd BufEnter term://* startinsert
-- ]])

vim.cmd("autocmd BufEnter * setlocal formatoptions-=o")
