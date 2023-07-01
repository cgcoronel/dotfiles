function! Term(...)
  let command = get(a:, 1, '') 
  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
      execute "q"
  else 
    vsp
    execute "normal \<C-l>"
    execute "term " . command
    set nonu nornu

    augroup TermAutocmds
      autocmd!
      autocmd BufLeave <buffer> stopinsert!
      autocmd BufEnter,BufWinEnter,WinEnter <buffer> startinsert!
    augroup END

    tnoremap <buffer> <c-h> <C-\\><C-n><C-w><C-h>
    tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>
    tnoremap <buffer> <leader>q <C-\\><C-n>:bd!<CR>

    execute "tnoremap <buffer> <leader>q <C-\\><C-n>:bd!<CR>"
    execute "tnoremap <buffer> <c-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    execute "normal \<C-h>\<C-l>"
  endif
endfunction
