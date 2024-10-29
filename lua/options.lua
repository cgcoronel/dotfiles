local global_options = {
	clipboard = "unnamedplus",
	number = true,
	relativenumber = true,
	-- relativenumber = false,
	wrap = false,
	showmode = true,
	mouse = "a",
	--	scrolloff = 999,
	shiftwidth = 2,
	autoindent = true,
	ignorecase = true,
	undofile = true,
	history = 1000,
	laststatus = 2,
	ttimeoutlen = 0,
	hidden = true,
	expandtab = true,
	encoding = "utf-8",
	foldmethod = "indent",
	foldlevelstart = 99,
	tabstop = 2,
}

for option, value in pairs(global_options) do
	vim.o[option] = value
end

vim.cmd([[
let g:minimal_italic_functions = 1
let g:minimal_transparent_background = 1 
]])

-- Terminal mappings
vim.cmd([[
function! TerminalMappings()
  startinsert
  setlocal nonu nornu
  tnoremap <buffer> <leader>q <C-\><C-n>:bd!<CR>
  tnoremap <buffer> <c-h> <C-\><C-n><C-w><C-h>
  tnoremap <buffer> <c-l> <C-\><C-n><C-w><C-l>
  tnoremap <buffer> <c-k> <C-\><C-n><C-w><C-k>
  tnoremap <buffer> <c-j> <C-\><C-n><C-w><C-j>
endfunction

autocmd TermOpen term://*zsh call TerminalMappings()
autocmd TermOpen term://*npx* call TerminalMappings()
autocmd BufEnter term://* startinsert
]])
