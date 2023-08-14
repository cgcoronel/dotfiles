-- global options
vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.showmode = true
vim.o.mouse = "a"
vim.g.netrw_banner = 0
vim.o.scrolloff = 999
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.undofile = true
vim.o.history = 1000
vim.o.laststatus = 0
vim.o.ttimeoutlen = 0
vim.o.hidden = true
vim.o.expandtab = true
vim.o.encoding = "utf-8"
vim.o.foldmethod = "indent"
vim.o.foldlevelstart=99

-- vim.cmd([[
--   hi NeoTreeNormal guibg=0
--   hi NeoTreeNormalNC guibg=0
-- 
-- " Netrw 
-- let g:netrw_keepdir = 1
-- let g:netrw_altv = 1
-- let g:netrw_list_hide = '.*\.DS_Store,.\.vscode,node_modules'
-- let g:netrw_hide = 1       
-- let g:netrw_fastbrowse = 0 
-- let g:netrw_bufsettings = 'nonu noma nomod nobl nowrap ro'
-- let g:netrw_banner = 0
-- 
-- function! CopyFile()
--   let file = expand("%:p") . netrw#Call('NetrwGetWord')
--   let newfile = input('Copy file: ', file)
--   silent execute '!cp' file newfile
-- endfunction
-- 
-- hi! link netrwMarkFile Search
-- augroup netrw_mapping
--   autocmd!
--   autocmd filetype netrw call NetrwMapping()
-- augroup END
-- 
-- function! NetrwMapping() abort
--   setlocal nocursorline
--   nmap <buffer> <nowait> c :call CopyFile()<CR>
--   nmap <buffer> <nowait> o <CR>
--   nmap <buffer> <nowait> p -
--   nmap <buffer> <nowait> a %
--   nmap <buffer> <nowait> s v<C-h>
--   nmap <buffer> <nowait> . :bnext<CR>
--   nmap <buffer> <nowait> m :bprevious<CR>
-- endfunction
-- 
-- autocmd FileType netrw setl bufhidden=wipe
-- 
-- nnoremap <Leader>e :let @/=expand("%:t") <Bar> execute 'Explore' expand("%:h") <Bar> normal n<CR>
-- 
-- ]])

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
