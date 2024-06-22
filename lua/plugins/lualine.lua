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
						--						color = { bg = "#1a1b26" }, -- tokyonight
						color = { bg = "#181c22" },
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
						--						color = { bg = "#1a1b26", fg = "#e6eaea" }, -- tokyonight
					},
				},
				lualine_c = {},
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
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
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
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
