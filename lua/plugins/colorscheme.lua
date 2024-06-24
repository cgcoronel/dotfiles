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
	"Yazeed1s/minimal.nvim",
	lazy = false,
	priority = 1000,

	config = function()
		vim.cmd("colorscheme minimal")

		vim.cmd([[
		  hi EndOfBuffer guifg=#1a1a25 
		]])
	end,
}

-- return {
-- 	"projekt0n/github-nvim-theme",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("github-theme").setup({
--
-- 			groups = {
-- 				all = {
-- 					Normal = { bg = "#1e2129" },
-- 					NormalNC = { bg = "#1e2129" },
-- 				},
-- 			},
--
-- 			options = {
-- 				transparent = false,
-- 				styles = {
-- 					comments = "italic",
-- 					keywords = "bold",
-- 					types = "italic,bold",
-- 				},
-- 			},
-- 		})
--
-- 		vim.cmd("colorscheme github_dark_tritanopia")
-- 		vim.cmd([[
--       hi EndOfBuffer guifg=#1e2129
--       hi StatusLine guifg=#c9d1d9 guibg=#0e1116
--       hi StatusLineNC cterm=NONE gui=NONE guifg=#30363d guibg=#0e1116
--     ]])
-- 	end,
-- }
