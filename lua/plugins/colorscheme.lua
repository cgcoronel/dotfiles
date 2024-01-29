return {
	"EdenEast/nightfox.nvim",
	priority = 1000,
	opts = function()
		return {
			transparent = true,
		}
	end,
	config = function()
		vim.cmd("colorscheme nightfox")
		-- vim.cmd("colorscheme terafox")
	end,
}
