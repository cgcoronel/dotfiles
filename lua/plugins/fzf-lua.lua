return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<leader>/", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
    { "<leader>f", "<cmd>FzfLua files<CR>", desc = "Find files" },
  },
  config = function()
    require("fzf-lua").setup({
      fzf_bin = "fzf",
      fzf_opts = {
        ['--ansi'] = true,
        ['--no-unicode'] = false,
      },
      fzf_colors = {
        ["fg"]      = { "fg", "Normal" },
        ["bg"]      = { "bg", "Normal" },
        ["hl"]      = { "fg", "Comment" },
        ["fg+"]     = { "fg", "CursorLine" },
        ["bg+"]     = { "bg", "CursorLine" },
        ["hl+"]     = { "fg", "Statement" },
        ["info"]    = { "fg", "PreProc" },
        ["prompt"]  = { "fg", "Conditional" },
        ["pointer"] = { "fg", "Constant" },
        ["marker"]  = { "fg", "Keyword" },
        ["spinner"] = { "fg", "Label" },
        ["header"]  = { "fg", "Comment" },
      },
    })
  end
}
