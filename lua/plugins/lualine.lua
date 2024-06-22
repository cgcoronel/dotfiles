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
						color = { bg = "#0d1117", fg = "#e6eaea" },
						--						color = { bg = "#1a1b26" }, -- tokyonight
						icon_only = true,
					},
					{
						"filename",
						--						color = { bg = "#1a1b26", fg = "#e6eaea" }, -- tokyonight
						color = { bg = "#0d1117", fg = "#e6eaea" },
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
						--						color = { bg = "#1a1b26" }, -- tokyonight
					},
				},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {
					{
						"filetype",
						color = { bg = "#0d1117", fg = "#e6eaea" },
						icon_only = true,
					},
					{
						"filename",
						color = { bg = "#0d1117", fg = "#e6eaea" },
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
