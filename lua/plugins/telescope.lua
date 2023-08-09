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
    },
    config = function()
      function fuzzy_find_files()
        require('telescope.builtin').find_files({
            find_command = {'rg', '--files', '--iglob', '!.git', '--hidden'},
            prompt_title = 'Fuzzy Find Files',
            hidden = true,
        })
      end
      vim.keymap.set('n', '<leader>f', '<cmd>lua fuzzy_find_files()<CR>', { noremap = true, silent = true })
    end
}
