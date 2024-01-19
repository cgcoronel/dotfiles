return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.5,
						results_width = 0.5,
					},
					vertical = {
						mirror = false,
					},
					width = 0.7,
					height = 0.50,
				},
			},
		})
		telescope.load_extension("fzf")
	end,
	keys = {
		{ ">", "<cmd>Telescope live_grep<CR>" },
		{ "<", "<cmd>Telescope git_branches<CR>" },
		{ "<leader>f", "<cmd>Telescope fd<CR>" },
	},
}
