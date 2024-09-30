return {
	"Yazeed1s/minimal.nvim",
	lazy = false,
	priority = 1000,

	config = function()
		vim.cmd("colorscheme minimal")

		vim.cmd([[
		  hi EndOfBuffer guifg=#1a1a25
      hi WinSeparator guibg=#171b21 guifg=#333a43
      hi LineNr guibg=#171b21
      hi SignColumn guibg=none
      hi GitSignsAdd guibg=none
      hi GitSignsChange guibg=none
      hi GitSignsDelete guibg=none
      hi DiagnosticSignHint guibg=none
      hi DiagnosticSignError guibg=none
      hi DiagnosticSignWarn guibg=none
      hi GitSignsStagedDelete guibg=none
      hi GitSignsStagedAdd guibg=none
      hi GitSignsStagedTopdelete guibg=none
		]])
	end,
}

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme tokyonight-night")
-- 	end,
-- }

-- return { "diegoulloao/neofusion.nvim", priority = 1000, config = true,
--  	config = function()
--     vim.o.background = "dark"
--     vim.cmd([[ colorscheme neofusion ]])
--  	end,
-- }

