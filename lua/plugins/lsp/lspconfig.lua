local opts = { noremap = true, silent = true }
local on_attach = function(_, bufnr)
	opts.buffer = bufnr
	local map = vim.keymap.set

	map("n", "gf", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
	map("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
	map("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
	map("n", "L", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- hover es flotante, no usa Telescope
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.diagnostic.config({
			virtual_text = false,
		})

		-- Show line diagnostics automatically in hover window
		vim.o.updatetime = 250
		vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		})
	end,
}
