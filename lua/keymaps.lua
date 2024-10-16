local cmd = vim.cmd
local map = vim.keymap.set

vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })

local silent = { silent = true, noremap = true }

function Quit()
	local bufinfo = vim.fn.getbufinfo({ buflisted = 1 })
	cmd(#bufinfo == 1 and "q" or "bd")
end

map("n", "<Leader>q", ":lua Quit()<CR>", silent)

map("i", "kj", "<Esc>")
map("n", "<leader>w", ":w<CR>", silent)

-- move between windows
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")
map("i", "<C-L>", "<Esc><C-W><C-L>")
map("i", "<C-H>", "<Esc><C-W><C-H>")

-- auto close brackets
map("i", "(", "()<Esc>i")
map("i", "[", "[]<Esc>i")
map("i", "{", "{}<Esc>i")

-- move lines up and down
map("n", "<C-J>", "10j")
map("n", "<C-K>", "10k")
map("v", "<C-J>", "10j")
map("v", "<C-K>", "10k")

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

map("n", "m", "<cmd>bprevious<cr>", silent)
map("n", ".", "<cmd>bnext<cr>", silent)

map("n", "<leader>a", ":windo diffthis<cr>", silent)

-- map("n", "<leader>j", ":cnext<cr>", silent)
-- map("n", "<leader>k", ":cprev<cr>", silent)
map("n", "<leader>;", ":cclose<cr>", silent)
map("n", "<leader>l", ":copen<cr>", silent)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		--	vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, "n", "o", "<CR>", { noremap = true, silent = true })
	end,
})

vim.api.nvim_create_user_command("QuickfixBuffers", function()
	local buffers = vim.fn.getbufinfo({ bufloaded = 1 })

	local qflist = {}
	for _, buf in ipairs(buffers) do
		if buf.name ~= "" then
			table.insert(qflist, { filename = buf.name, lnum = 0 })
		end
	end

	vim.fn.setqflist(qflist, "r")
	vim.cmd("copen")
	vim.cmd("resize 5")
end, {})

map("n", "<leader>s", ":QuickfixBuffers<cr>", silent)
