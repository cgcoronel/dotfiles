return {
    'akinsho/bufferline.nvim', 
    event = 'VeryLazy',
    version = "*", 
    config = function()
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
    end

}
