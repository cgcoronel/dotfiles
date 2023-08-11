return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    event = "VeryLazy",
    dependencies = { 
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { ">", "<cmd>Telescope live_grep<CR>" },
      { "<", "<cmd>Telescope git_branches<CR>" },
      { "<leader>f", "<cmd>Telescope fd<CR>" },
    },
}
