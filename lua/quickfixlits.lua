local map = vim.keymap.set
local silent = { silent = true, noremap = true }

vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function()
		if vim.bo.buftype == "quickfix" then
			vim.api.nvim_buf_set_keymap(0, "n", "o", "<CR>", silent)
		end
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
end, {})

-- map("n", "<leader>a", ":QuickfixBuffers<CR>", silent)
map("n", "<leader>s", ":copen<CR>", silent)
map("n", "<leader>j", ":cnext<CR>", silent)
map("n", "<leader>k", ":cprev<CR>", silent)
