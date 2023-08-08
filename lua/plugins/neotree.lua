return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { '<leader>e', '<cmd>Neotree current reveal_force_cwd<CR>'}
  },
  init = function()
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree")
      end
    end
  end,
  opts = {
    filesystem = {
      hijack_netrw_behavior = "open_current",
      window = {
        mappings = {
          ["o"] = "open",
          ["p"] = "close_node",
          ["<"] = "noop",
          [">"] = "noop"
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
  }
}
