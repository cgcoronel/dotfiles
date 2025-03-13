local map = vim.keymap.set
local silent = { silent = true, noremap = true }

vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function()
		if vim.bo.buftype == "quickfix" then
			vim.api.nvim_buf_set_keymap(0, "n", "o", "<CR>", silent)
		end
	end,
})
