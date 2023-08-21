local M = {}

function M.setup()
	function Quit()
		local buffers = {}
		for i = 1, vim.fn.bufnr("$") do
			if vim.fn.buflisted(i) then
				table.insert(buffers, i)
			end
		end

		if #buffers == 1 then
			vim.cmd("q")
		else
			vim.cmd("bd")
		end
	end

	local nmap = function(keys, func)
		vim.keymap.set("n", keys, func)
	end

	local imap = function(keys, func)
		vim.keymap.set("i", keys, func)
	end

	local vmap = function(keys, func)
		vim.keymap.set("v", keys, func)
	end

	nmap("<Leader>q", ":lua Quit()<CR>")
	nmap("<Leader>p", ":Format<CR>")

	imap("kj", "<Esc>")
	nmap("<leader>w", ":w<CR>")

	-- move between windows
	nmap("<C-L>", "<C-W><C-L>")
	nmap("<C-H>", "<C-W><C-H>")
	imap("<C-L>", "<Esc><C-W><C-L>")
	imap("<C-H>", "<Esc><C-W><C-H>")

	-- auto close brackets
	imap("(", "()<Esc>i")
	imap("[", "[]<Esc>i")
	imap("`", "``<Esc>i")
	imap('"', '""<Esc>i')
	imap("{", "{}<Esc>i")
	imap("'", "''<Esc>i")

	-- move lines up and down
	nmap("<C-J>", "10j")
	nmap("<C-K>", "10k")

	-- move start and end of line
	nmap("gl", "$")
	nmap("gh", "0")
	vmap("gl", "$")
	vmap("gh", "0")

	-- clean search
	nmap("<leader><space>", ":noh<CR>")

	-- move lines up and down
	nmap("<S-j>", ":m .+1<CR>")
	nmap("<S-k>", ":m .-2<CR>")

	-- split buffer
	nmap("s", ":vsp<CR>")

	-- copy file path
	nmap("cp", ':let @+ = expand("%") <bar> echo "copied " . expand("%")<CR>')

	nmap("<leader>.", ":vsp .env<CR>")
end

return M
