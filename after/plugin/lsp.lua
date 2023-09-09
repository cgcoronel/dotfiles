-- local on_attach = function(_, bufnr)
-- 	local bufmap = function(keys, func)
-- 		vim.keymap.set("n", keys, func, { buffer = bufnr })
-- 	end
--
-- 	--	bufmap("L", vim.lsp.buf.hover)
-- end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("mason").setup()

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

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
