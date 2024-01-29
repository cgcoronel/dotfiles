local global_options = {
	clipboard = "unnamedplus",
	number = true,
	relativenumber = true,
	wrap = false,
	showmode = true,
	mouse = "a",
	scrolloff = 999,
	shiftwidth = 2,
	autoindent = true,
	ignorecase = true,
	undofile = true,
	history = 1000,
	laststatus = 2,
	ttimeoutlen = 0,
	hidden = true,
	expandtab = true,
	encoding = "utf-8",
	foldmethod = "indent",
	foldlevelstart = 99,
	tabstop = 2,
}

for option, value in pairs(global_options) do
	vim.o[option] = value
end
