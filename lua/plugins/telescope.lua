return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    cmd = 'Telescope',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { ">",         "<cmd>Telescope live_grep<CR>" },
      { "<",         "<cmd>Telescope git_branches<CR>" },
      { "<leader>f", "<cmd>Telescope fd<CR>" },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,             -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      })

      require("telescope").load_extension("fzf")

      vim.cmd([[
        hi TelescopeNormal guibg=0
        hi TelescopeBorder guibg=0
      ]])
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
