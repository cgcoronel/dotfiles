return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					{
						"filetype",
						icon_only = true,
					},
					{
						"filename",
						file_status = false,
						path = 1,
					},
				},
				lualine_b = {
					{
						"diagnostics",
					},
				},
				lualine_c = {
					{
						function()
							return ""
						end,
					},
				},
				lualine_x = {},
				lualine_y = {
					{
						"location",
					},
				},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {
					{
						"filetype",
						icon_only = true,
					},
					{
						"filename",
						file_status = false,
						path = 1,
					},
				},
				lualine_b = {
					{
						"diagnostics",
					},
				},
				lualine_c = {
					{
						function()
							return ""
						end,
						color = { bg = "#0d1117" },
					},
				},
				lualine_x = {},
				lualine_y = {
					{
						"location",
					},
				},
				lualine_z = {},
			},
		})
	end,
}
