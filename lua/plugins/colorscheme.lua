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

return {
	"getomni/neovim",
	lazy = false,
	config = function()
		vim.cmd([[colorscheme omni]])
	end,
}
