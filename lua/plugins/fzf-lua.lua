return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<leader>/", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
    { "<leader>f", "<cmd>FzfLua files<CR>", desc = "Find files (fd)" },
  },
}
