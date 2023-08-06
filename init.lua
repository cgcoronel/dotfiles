local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " 

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
--       { "<leader>f", "<cmd>Telescope find_files<CR>" },
      { ">", "<cmd>Telescope live_grep<CR>" },
    },
  },

  {
    'akinsho/bufferline.nvim', 
    event = 'VeryLazy',
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  { 'github/copilot.vim' },

  { 
    'lewis6991/gitsigns.nvim',
    lazy = true,
    keys = {
      { "<Backspace>", "<cmd>Gitsigns prev_hunk<CR>" },
      { "<CR>", "<cmd>Gitsigns next_hunk<CR>" },
    }
  },

  { 
    'tpope/vim-fugitive',
    lazy = true,
    keys = {
      { "<leader>d", "<cmd>0Git<CR>" },
    }
  },

  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     -- add tsx and treesitter
  --     vim.list_extend(opts.ensure_installed, {
  --       "typescript",
  --       "javascript",
  --     })
  --   end,
  -- },
  
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { '<leader>e', '<cmd>Neotree current reveal_force_cwd<CR>'}
    }
  },

  { 
    "ggandor/flit.nvim",
    dependencies = {
      'ggandor/leap.nvim',
      'tpope/vim-repeat'
    } 
  },

})

-- Configuraciones generales
vim.cmd([[
  colorscheme tokyonight-night
  set mouse=a
  set clipboard=unnamedplus
  set encoding=UTF-8
  set showmatch
  set number relativenumber
  set sw=2
  set ttimeoutlen=0
  set undofile
  set history=1000
  set autoindent
  set foldmethod=indent
  set foldlevelstart=99
  set ignorecase
  set nowrap
  set hidden
  set so=999
  set laststatus=0
]])

-- Configuración específica para el plugin "copilot.nvim"
vim.cmd('let g:copilot_node_command = "~/node-v18.17.0/bin/node"')

-- Configuración de la variable 'runtimepath' para plugins
vim.cmd('set rtp+=~/.config/nvim/plugged/*,/opt/homebrew/opt/fzf')


require('gitsigns').setup {
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

-- init.lua
require('mappings').setup()
require("neo-tree").setup({
  filesystem = {
    hijack_netrw_behavior = "open_current",
    window = {
      mappings = {
	["o"] = "open",
	["p"] = "close_node"
      }
    },
    filtered_items = {
       visible = false, -- when true, they will just be displayed differently than normal items
       hide_dotfiles = false,
       hide_gitignored = true,
       hide_by_name = {
         "node_modules",
       },
     },
  }
})

require("bufferline").setup{
  options = {
   custom_filter = function(buf_number, buf_numbers)
        if vim.bo[buf_number].filetype ~= "netrw" then
	  return true
        end
   end,
   offsets = {
      {
        filetype = "neo-tree",
        text = "Neo tree",
        highlight = "Directory",
        text_align = "left",
      },
    },
  }
}

require('flit').setup {
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  labeled_modes = "v",
  multiline = true,
  opts = {}
}
