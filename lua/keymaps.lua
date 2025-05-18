local map = vim.keymap.set
local opts = { silent = true, noremap = true }

vim.g.mapleader = " "
map({ "n", "v" }, "<Space>", "<NOP>", opts)

map("n", "<leader>q", function()
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	vim.cmd(#buffers == 1 and "qa" or "bd")
end, opts)

map("i", "kj", "<Esc>", opts)
map("n", "<leader>w", vim.cmd.w, opts)

-- move between windows
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")
map("i", "<C-L>", "<Esc><C-W><C-L>")
map("i", "<C-H>", "<Esc><C-W><C-H>")

map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("i", "<C-J>", "<Esc><C-W><C-J>")
map("i", "<C-K>", "<Esc><C-W><C-K>")

-- move start and end of line
map("n", "gl", "$")
map("n", "gh", "0")
map("v", "gl", "$")
map("v", "gh", "0")

-- clean search
map("n", "<leader><space>", ":noh<CR>", opts)

-- move lines up and down
map("n", "<S-k>", ":m .-2<CR>==", opts)
map("n", "<S-j>", ":m .+1<CR>==", opts)
map("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

-- split buffer
map("n", "s", ":vsp<CR>", opts)

-- copy file path
map("n", "cp", ':let @+ = expand("%") <bar> echo "copied " . expand("%")<CR>', opts)

map("v", "p", '"_dP')

map("n", "<leader>D", ":windo diffthis<cr>", opts)
