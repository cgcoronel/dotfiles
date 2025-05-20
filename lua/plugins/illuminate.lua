return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		delay = 200,
		large_file_cutoff = 2000,
		large_file_overrides = {
			providers = { "lsp" },
		},
		filetypes_denylist = {
			"NvimTree",
			"TelescopePrompt",
			"alpha",
			"dashboard",
			"help",
			"markdown",
			"gitcommit",
		},
	},
	config = function(_, opts)
		require("illuminate").configure(opts)

		local function map(key, dir, buffer)
			vim.keymap.set("n", key, function()
				require("illuminate")["goto_" .. dir .. "_reference"](false)
			end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
		end

		map(";", "next")
		map("<C-;>", "prev")

		vim.cmd([[
	       hi IlluminatedWordRead gui=none guifg=none guibg=#272932
	     ]])

		local stat = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
		if stat and stat.size > 500000 then
			vim.b.illuminate_disable = true
		end
	end,
}
