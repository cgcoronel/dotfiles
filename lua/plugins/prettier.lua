return {
  'MunifTanjim/prettier.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
  },
  lazy = false,
  config = function()
    require("prettier").setup({
      bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      }
    })
  end,
  keys = {
    { "<leader>p", "<cmd>Prettier<CR>" },
  }
}
