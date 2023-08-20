local null_ls_status_ok, null_ls = pcall(require, "null-ls")

if not null_ls_status_ok then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(_, bufnr)
  if _.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          filter = function(client)
             return client.name == "null-ls"
          end,
        })
      end,
    })
  end
end

null_ls.setup({
  debug = false,
  on_attach = on_attach,
  sources = {
    -- null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
    --    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "typescript",
        "css",
        "scss",
        "html",
        "json",
        "yaml",
        "markdown",
        "graphql",
        "md",
        "txt",
      },
      only_local = "node_modules/.bin",
    }),
    -- setting eslint_d only if we have a ".eslintrc.js" file in the project
    --    null_ls.builtins.diagnostics.eslint_d.with({
    --      condition = function(utils)
    --        return utils.root_has_file({ '.eslintrc.js' })
    --      end
    --    }),

  },
})
