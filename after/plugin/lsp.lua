local on_attach = function(_, bufnr)
  local bufmap = function(keys, func)
    vim.keymap.set("n", keys, func, { buffer = bufnr })
  end

  bufmap("L", vim.lsp.buf.hover)

  --  vim.api.nvim_create_autocmd("BufWrite", {
  --    callback = function()
  --      vim.lsp.buf.format({ async = false })
  --    end,
  --  })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- mason
require("mason").setup()
require("mason-lspconfig").setup_handlers({

  function(server_name)
    require("lspconfig")[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,

  ["lua_ls"] = function()
    require("neodev").setup()
    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    })
  end,
})
