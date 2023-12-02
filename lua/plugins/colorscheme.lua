-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("tokyonight-night")
-- 	end,
-- }

-- return {
-- 	{
-- 		"craftzdog/solarized-osaka.nvim",
-- 		priority = 1000,
-- 		opts = function()
-- 			return {
-- 				transparent = true,
-- 			}
-- 		end,
-- 		config = function()
-- 			vim.cmd("colorscheme solarized-osaka")
-- 		end,
-- 	},
-- }

return {
	"EdenEast/nightfox.nvim",
	priority = 1000,
	opts = function()
		return {
			transparent = true,
		}
	end,
	config = function()
		--		vim.cmd("colorscheme nightfox")
		vim.cmd("colorscheme terafox")
	end,
}
