local lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazyPath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazyPath,
	})
end
vim.opt.rtp:prepend(lazyPath)

local plugins = {
	{ import = "plugins" },
	{ import = "plugins.lsp" },
}

local options = {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
}
require("options")
require("keymaps")
require("netrw")
require("quickfixlits")
require("lazy").setup(plugins, options)

vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		vim.cmd([[colorscheme xcodedarkhc]])
	end,
})
