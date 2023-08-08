return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  'github/copilot.vim',
  { 
    'tpope/vim-fugitive',
    lazy = false,
    keys = {
      { "<leader>d", "<cmd>0Git<CR>" },
    }
  }
}
