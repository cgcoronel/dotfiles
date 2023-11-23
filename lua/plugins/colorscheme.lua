-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("tokyonight-night")
-- 	end,
-- }

return {
	"EdenEast/nightfox.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme nightfox")
		-- vim.cmd("colorscheme terafox")
	end,
}
