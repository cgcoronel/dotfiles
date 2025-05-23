return {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<Backspace>", "<cmd>Gitsigns prev_hunk<CR>" },
		{ "<CR>", "<cmd>Gitsigns next_hunk<CR>" },
	},
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true,
			watch_gitdir = {
				follow_files = true,
			},
			attach_to_untracked = true,
		})
	end,
}
