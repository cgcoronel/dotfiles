-- local on_attach = function(_, bufnr)
-- 	local bufmap = function(keys, func)
-- 		vim.keymap.set("n", keys, func, { buffer = bufnr })
-- 	end
--
-- 	--	bufmap("L", vim.lsp.buf.hover)
-- end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- mason
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({})
mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"lua_ls",
	},
	automatic_installation = true,
})

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["html"].setup({
	capabilities = capabilities,
	--	on_attach = on_attach,
})

lspconfig["tsserver"].setup({
	capabilities = capabilities,
	--on_attach = on_attach,
})

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	--	on_attach = on_attach,
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})
-- require("mason-lspconfig").setup_handlers({
-- 	function(server_name)
-- 		require("lspconfig")[server_name].setup({
-- 			on_attach = on_attach,
-- 			capabilities = capabilities,
-- 		})
-- 	end,
--
-- 	["lua_ls"] = function()
-- 		require("neodev").setup()
-- 		require("lspconfig").lua_ls.setup({
-- 			on_attach = on_attach,
-- 			capabilities = capabilities,
-- 			Lua = {
-- 				workspace = { checkThirdParty = false },
-- 				telemetry = { enable = false },
-- 			},
-- 		})
-- 	end,
-- })
