-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = function()
-- 		return {
-- 			transparent = true,
-- 		}
-- 	end,
-- 	config = function()
-- 		vim.cmd("colorscheme tokyonight-night")
-- 	end,
-- }

-- return {
-- 	"eldritch-theme/eldritch.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		vim.cmd("colorscheme eldritch")
--     vim.cmd("hi NormalFloat guifg=#ebfafa guibg=#171928")
-- 	end,
-- }

return {
	"projekt0n/github-nvim-theme",
	lazy = false,
	priority = 1000,
	config = function()
		require("github-theme").setup({
			options = {
				transparent = true,
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
		})

		vim.cmd("colorscheme github_dark_tritanopia")
	end,
}
