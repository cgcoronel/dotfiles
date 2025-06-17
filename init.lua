local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazy_path,
	})
end
vim.opt.rtp:prepend(lazy_path)

local opts = {
	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
	performance = {
		cache = {
			enabled = true,
		},
	},
}

-- plugins
require("options")
require("keymaps")
require("netrw")

require("lazy").setup({
	{ import = "plugins" },
}, opts)
