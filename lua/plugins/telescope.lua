return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "ignore_case",
				},
			},
			defaults = {
				selection_caret = "  ",
				entry_prefix = "  ",
				path_display = { "smart" },
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.6,
						results_width = 0.4,
					},
					vertical = {
						mirror = false,
					},
					width = 0.9,
					height = 0.60,
				},
			},
		})
		telescope.load_extension("fzf")

		vim.cmd([[
			hi TelescopeBorder guifg=#333a43
			hi TelescopePromptPrefix guifg=#333a43 guibg=none
		]])
	end,
	keys = {
		{ ">", "<cmd>Telescope live_grep<CR>" },
		{ "<leader>f", "<cmd>Telescope fd<CR>" },
	},
}
