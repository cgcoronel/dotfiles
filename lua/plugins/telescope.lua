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
		})
		telescope.load_extension("fzf")

		vim.cmd("hi TelescopeNormal guibg=0")
		vim.cmd("hi TelescopeBorder guibg=0")
	end,
	keys = {
		{ ">", "<cmd>Telescope live_grep<CR>" },
		{ "<", "<cmd>Telescope git_branches<CR>" },
		{ "<leader>f", "<cmd>Telescope fd<CR>" },
	},
}
