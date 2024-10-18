vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		--	vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, "n", "o", "<CR>:cclose<CR>", { noremap = true, silent = true })
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

local map = vim.keymap.set
local silent = { silent = true, noremap = true }

map("n", "<leader>s", ":QuickfixBuffers<cr>", silent)
