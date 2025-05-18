local map = vim.keymap.set
local silent = { silent = true, noremap = true }

vim.g.mapleader = " "
map("n", "<Space>", "<NOP>", silent)

function Quit()
	local bufinfo = vim.fn.getbufinfo({ buflisted = 1 })
	vim.cmd(#bufinfo == 1 and "qa" or "bd")
end

map("n", "<leader>q", Quit, silent)

map("i", "kj", "<Esc>")
map("n", "<leader>w", ":w<CR>", silent)

-- move between windows
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")
map("i", "<C-L>", "<Esc><C-W><C-L>")
map("i", "<C-H>", "<Esc><C-W><C-H>")

map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("i", "<C-J>", "<Esc><C-W><C-J>")
map("i", "<C-K>", "<Esc><C-W><C-K>")

-- auto close brackets
map("i", "(", "()<Esc>i")
map("i", "[", "[]<Esc>i")
map("i", "{", "{}<Esc>i")

-- move start and end of line
map("n", "gl", "$")
map("n", "gh", "0")
map("v", "gl", "$")
map("v", "gh", "0")

-- clean search
map("n", "<leader><space>", ":noh<CR>", silent)

-- move lines up and down
map("n", "<S-j>", ":m .+1<CR>", silent)
map("n", "<S-k>", ":m .-2<CR>", silent)

-- split buffer
map("n", "s", ":vsp<CR>", silent)

-- copy file path
map("n", "cp", ':let @+ = expand("%") <bar> echo "copied " . expand("%")<CR>', silent)

map("v", "p", '"_dP')

map("n", "<leader>D", ":windo diffthis<cr>", silent)
