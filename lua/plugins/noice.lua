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
				enabled = true,
				opts = {
					position = {
						row = "90%",
            col = "5%",
					},
					size = {
						width = 60, -- ancho del cmdline (ajusta según prefieras)
						height = "auto", -- altura automática
					},
				},
			},
			messages = {
				enabled = false,
			},
			presets = {
				--	bottom_search = true,
				--	command_palette = true,
			},
			lsp = {
				progress = {
					enabled = false,
				},
			},
		})

		vim.cmd([[
      hi NoiceCmdlinePopupBorder guifg=#333a43 guibg=none
      hi NoiceCmdlineIconCmdline guifg=#333a43 guibg=none
      hi NoiceCmdlineIconSearch guifg=#333a43 guibg=none
      hi NoiceCmdlinePopupBorderSearch guifg=#333a43 guibg=none
    ]])
	end,
}
