return {
	"folke/zen-mode.nvim",
	config = function()
		local zenMode = require("zen-mode")
		zenMode.setup({
			window = {
				width = 150,
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false, -- disables the ruler text in the cmd line area
					showcmd = true, -- disables the command in the last line of the screen
					laststatus = 0, -- turn off the statusline in zen mode
				},
			},
		})

		vim.keymap.set("n", "Z", "<cmd>ZenMode<CR>")
	end,
}
