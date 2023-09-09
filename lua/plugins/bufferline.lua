local options = {
	offsets = {
		{
			filetype = "neo-tree",
			text = "Neo tree",
			highlight = "Directory",
			text_align = "left",
		},
		{
			filetype = "netrw",
			text = "Netrw",
			highlight = "Directory",
			text_align = "left",
		},
	},
}

return {
	"akinsho/bufferline.nvim",
	event = "BufReadPre",
	version = "*",
	keys = {
		{ "m", "<cmd>bprevious<CR>" },
		{ ".", "<cmd>bnext<CR>" },
	},
	opts = {
		highlights = {},
		options = options,
	},
}
