return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				view = "cmdline",
			},
			messages = {
				enabled = false,
			},
			lsp = {
				progress = {
					enabled = false,
				},
			},
		})

 --     hi NoiceCmdlinePopupBorder guifg=#333a43 guibg=none
 --     hi NoiceCmdlineIconSearch guifg=#333a43 guibg=none
 --     hi NoiceCmdlinePopupBorderSearch guifg=#333a43 guibg=none
		vim.cmd([[
      hi NoiceCmdlineIconCmdline guifg=#333a43 guibg=none
    ]])
	end,
}
