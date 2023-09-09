return {
	"neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
	  "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true }
  },
  config = function()
    local lspconfig = require("lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      vim.keymap.set("n", "L", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    end

    lspconfig["tsserver"].setup({
    	capabilities = capabilities,
    	on_attach = on_attach,
    })

    lspconfig["lua_ls"].setup({
	    capabilities = capabilities,
    	on_attach = on_attach,
	    settings = {
		    Lua = {
			    workspace = { checkThirdParty = false },
			    telemetry = { enable = false },
		    },
	    },
    })
  end,
}
