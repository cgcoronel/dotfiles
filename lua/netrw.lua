local netrw_options = {
	netrw_keepdir = 1,
	netrw_altv = 1,
	netrw_list_hide = ".*\\.DS_Store,.\\.vscode,node_modules",
	netrw_hide = 1,
	netrw_fastbrowse = 0,
	netrw_bufsettings = "nonu noma nomod nobl nowrap ro nu",
	netrw_banner = 0,
}

for option, value in pairs(netrw_options) do
	vim.g[option] = value
end

vim.cmd([[
function! CopyFile()
  let file = expand("%:p") . netrw#Call('NetrwGetWord')
  let newfile = input('Copy file: ', file)
  silent execute '!cp' file newfile
endfunction

hi! link netrwMarkFile Search
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping() abort
  setlocal nocursorline
  nmap <buffer> <nowait> c :call CopyFile()<CR>
  nmap <buffer> <nowait> o <CR>
  nmap <buffer> <nowait> p -
  nmap <buffer> <nowait> a %
  nmap <buffer> <nowait> s v<C-h>
  nmap <buffer> <nowait> . :bnext<CR>
  nmap <buffer> <nowait> m :bprevious<CR>
  nmap <buffer> <nowait> <C-L> <C-W><C-L>
  nmap <buffer> <nowait> <C-H> <C-W><C-H>
endfunction

autocmd FileType netrw setl bufhidden=wipe

nnoremap <silent> <Leader>e :let @/=expand("%:t") <Bar> execute 'Explore' expand("%:h") <Bar> normal n<CR>
]])
