return {
	--	{
	--		"Exafunction/codeium.vim",
	--		dependencies = {
	--			"nvim-lua/plenary.nvim",
	--			"hrsh7th/nvim-cmp",
	--		},
	--		event = "BufEnter",
	--		config = function()
	--			vim.keymap.set("i", "<C-Space>", function()
	--				return vim.fn["codeium#Accept"]()
	--			end, { expr = true, silent = true })
	--		end,
	--	},
	{
		"github/copilot.vim",
	},
}
