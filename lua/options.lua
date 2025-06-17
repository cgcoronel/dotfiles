local opt = vim.opt

opt.number = true
opt.relativenumber = false 
opt.cursorline = false
opt.signcolumn = "auto"
opt.termguicolors = true
opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.laststatus = 0

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

opt.lazyredraw = true
opt.updatetime = 100
opt.timeoutlen = 400

opt.undofile = true
opt.backup = false
opt.writebackup = false

opt.clipboard = "unnamedplus"
opt.ttimeoutlen = 0

vim.g.minimal_italic_functions = 1
vim.g.minimal_transparent_background = 1

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "setlocal formatoptions-=o",
})

vim.keymap.set("n", "<C-j>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-j>", "<Nop>", { noremap = true, silent = true })

vim.opt.fillchars:append({ eob = " " })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "fugitive",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
