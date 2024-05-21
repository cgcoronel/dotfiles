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
	"eldritch-theme/eldritch.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd("colorscheme eldritch")
    vim.cmd("hi NormalFloat guifg=#ebfafa guibg=#171928")
	end,
}
