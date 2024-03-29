local cmd = vim.cmd
local map = vim.keymap.set

vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })

function Quit()
	local bufinfo = vim.fn.getbufinfo({ buflisted = 1 })
	cmd(#bufinfo == 1 and "q" or "bd")
end

map("n", "<Leader>q", ":lua Quit()<CR>")

map("i", "kj", "<Esc>")
map("n", "<leader>w", ":w<CR>")

-- move between windows
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")
map("i", "<C-L>", "<Esc><C-W><C-L>")
map("i", "<C-H>", "<Esc><C-W><C-H>")

-- auto close brackets
map("i", "(", "()<Esc>i")
map("i", "[", "[]<Esc>i")
map("i", "`", "``<Esc>i")
map("i", '"', '""<Esc>i')
map("i", "{", "{}<Esc>i")
map("i", "'", "''<Esc>i")

-- move lines up and down
map("n", "<C-J>", "10j")
map("n", "<C-K>", "10k")

-- move start and end of line
map("n", "gl", "$")
map("n", "gh", "0")
map("v", "gl", "$")
map("v", "gh", "0")

-- clean search
map("n", "<leader><space>", ":noh<CR>")

-- move lines up and down
map("n", "<S-j>", ":m .+1<CR>")
map("n", "<S-k>", ":m .-2<CR>")

-- split buffer
map("n", "s", ":vsp<CR>")

-- copy file path
map("n", "cp", ':let @+ = expand("%") <bar> echo "copied " . expand("%")<CR>')

map("n", "<leader>.", ":vsp .env<CR>")

map("v", "p", '"_dP')

map("n", "m", "<cmd>bprevious<cr>")
map("n", ".", "<cmd>bnext<cr>")

vim.cmd("cnoreabbrev pr lua vim.lsp.buf.format()")
