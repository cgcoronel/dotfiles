return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
--       { "<leader>f", "<cmd>Telescope find_files<CR>" },
      { ">", "<cmd>Telescope live_grep<CR>" },
      { "<", "<cmd>Telescope git_branches<CR>" },
    }
}
