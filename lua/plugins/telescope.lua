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
			defaults = {
				selection_caret = "  ",
				entry_prefix = "  ",
				path_display = { "smart" },
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.6,
						results_width = 0.4,
					},
					width = 0.9,
					height = 0.9,
				},
			},
			pickers = {
				lsp_references = {
					show_line = false,
				},
				lsp_definitions = {
					show_line = false,
				},
				lsp_implementations = {
					show_line = false,
				},
				lsp_declarations = {
					show_line = false,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "ignore_case",
				},
			},
		})

		telescope.load_extension("fzf")

		-- Colores más prolijos
		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#333a43" })
		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#333a43", bg = "NONE" })
	end,
	keys = {
		--	{ ">", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
		{ ">", ":echo 'usa: leader/'<cr>", desc = "Live grep" },
		{ "<leader>/", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
		{ "<leader>f", "<cmd>Telescope fd<CR>", desc = "Find file (fd)" },
	},
}
