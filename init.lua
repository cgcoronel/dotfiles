local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " 

require("lazy").setup({
  { import = "plugins" }
})

-- global options 
vim.o.mouse = "a"
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.showmode = true

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
]])
vim.g.netrw_banner = 0

-- Configuración específica para el plugin "copilot.nvim"
vim.cmd('let g:copilot_node_command = "~/node-v18.17.0/bin/node"')

-- init.lua
require('keymaps').setup()
