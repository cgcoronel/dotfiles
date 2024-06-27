return {
	"Yazeed1s/minimal.nvim",
	lazy = false,
	priority = 1000,

	config = function()
		vim.cmd("colorscheme minimal")

		vim.cmd([[
		  hi EndOfBuffer guifg=#1a1a25 
      hi WinSeparator guibg=#171b21 guifg=#333a43
      hi LineNr guibg=#171b21 
      hi SignColumn guibg=none
      hi GitSignsAdd guibg=none 
      hi GitSignsChange guibg=none 
      hi GitSignsDelete guibg=none 
      hi DiagnosticSignHint guibg=none
      hi DiagnosticSignError guibg=none
      hi DiagnosticSignWarn guibg=none
      hi GitSignsStagedDelete guibg=none
      hi GitSignsStagedAdd guibg=none
      hi GitSignsStagedTopdelete guibg=none
		]])
	end,
}

-- hi GitSignsChangedelete guibg=none
-- hi GitSignsTopdelete guibg=none
-- hi GitSignsUntracked guibg=none
-- hi GitSignsAddNr guibg=none
-- hi GitSignsChangeNr guibg=none
-- hi GitSignsDeleteNr guibg=none
-- hi GitSignsChangedeleteNr guibg=none
-- hi GitSignsTopdeleteNr guibg=none
-- hi GitSignsUntrackedNr guibg=none
-- hi GitSignsAddLn guibg=none
-- hi GitSignsChangeLn guibg=none
-- hi GitSignsChangedeleteLn guibg=none
-- hi GitSignsUntrackedLn guibg=none
-- hi GitSignsStagedChange guibg=none
-- hi GitSignsStagedChangedelete guibg=none
-- hi GitSignsStagedTopdelete guibg=none
-- hi GitSignsStagedAddNr guibg=none
-- hi GitSignsStagedChangeNr guibg=none
-- hi GitSignsStagedDeleteNr guibg=none
-- hi GitSignsStagedChangedeleteNr guibg=none
-- hi GitSignsStagedTopdeleteNr guibg=none
-- hi GitSignsStagedAddLn guibg=none
-- hi GitSignsStagedChangeLn guibg=none
-- hi GitSignsStagedChangedeleteLn guibg=none
-- hi GitSignsAddPreview guibg=none
-- hi GitSignsDeletePreview guibg=none
-- hi GitSignsCurrentLineBlame guibg=none
-- hi GitSignsAddInline guibg=none
-- hi GitSignsDeleteInline guibg=none
-- hi GitSignsChangeInline guibg=none
-- hi GitSignsAddLnInline guibg=none
-- hi GitSignsChangeLnInline guibg=none
-- hi GitSignsDeleteLnInline guibg=none
-- hi GitSignsDeleteVirtLn guibg=none
-- hi GitSignsDeleteVirtLnInLine guibg=none
-- hi GitSignsVirtLnum guibg=none
