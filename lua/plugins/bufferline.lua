return {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    version = "*",
    config = function()
      require("bufferline").setup {
	options = {
	  offsets = {
	    {
	      filetype = "neo-tree",
	      text = "Neo tree",
	      highlight = "Directory",
	      text_align = "left",
            }
          }
	}
      }
    end
}
