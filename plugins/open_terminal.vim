" Open terminal   
function! OpenTerminal()

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else 
    botright new
    exec "resize 10"
    " open terminal
    execute "term"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-k> <C-\\><C-n><C-w><C-k>"
    execute "tnoremap <buffer> <C-j> <C-\\><C-n><C-w><C-j>"

    execute "tnoremap <buffer> <Leader>q <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
