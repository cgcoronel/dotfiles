return {
	"tpope/vim-fugitive",
	cmd = "Git",
	keys = {
		{ "<leader>d", "<cmd>0Git<CR>" },
	},
	config = function()
		vim.cmd([[
       augroup fugitive_mapping
         autocmd!
         autocmd filetype fugitive nmap <buffer> <nowait> <silent> ff dv :resize 100<CR>
         autocmd filetype fugitive nmap <buffer> <nowait> <silent> o gO <C-l>:q<CR>
       augroup END
     ]])

		vim.cmd("cnoreabbrev gco Git commit")
		vim.cmd("cnoreabbrev gpu Git push")
		vim.cmd("cnoreabbrev gbb Git blame ")
	end,
}
