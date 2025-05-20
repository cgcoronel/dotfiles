local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(_, bufnr)
	if _.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					filter = function(client)
						return client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end,
		})
	end
end

return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")

		local null_ls_utils = require("null-ls.utils")

		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {
				formatting.stylua,
				formatting.prettierd.with({
					filetypes = {
						"javascript",
						"typescript",
						"json",
						"yaml",
						"graphql",
						"md",
						"txt",
					},
					fonly_local = "node_modules/.bin",
				}),
			},
			debug = false,
			on_attach = on_attach,
		})
	end,
}
