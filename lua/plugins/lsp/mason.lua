return {
	"mason-org/mason.nvim",
	event = "VeryLazy",
	dependencies = {
        "mason-org/mason-lspconfig.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()
		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"lua_ls",
			},
			automatic_installation = true,
		})
	end,
}
