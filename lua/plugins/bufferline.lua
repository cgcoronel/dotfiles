return {
  "akinsho/bufferline.nvim",
  event = "BufReadPre",
  version = "*",
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo tree",
            highlight = "Directory",
            text_align = "left",
          },
          {
            filetype = "netrw",
            text = "Netrw",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })
  end,
}
