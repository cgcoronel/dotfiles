return {
	--	"folke/tokyonight.nvim",
	"shaunsingh/nord.nvim",
	-- "catppuccin/nvim",
	priority = 1000,
	config = function()
		-- vim.cmd.colorscheme("catppuccin")
		-- vim.cmd.colorscheme("tokyonight-night")

--	vim.cmd.colorscheme("nord")
		vim.g.nord_disable_background = true
		vim.g.nord_italic = false
		vim.g.nord_bold = true
		require("nord").set()
	end,
}
