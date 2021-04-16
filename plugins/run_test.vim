" Run test in focus file   
function! RunTest()
    echo('Running unit test...')

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else 
    "get filename
    let b:filename=expand('%')

    vsplit
    execute "normal \<C-l>"
    execute "term npm run test:watch " . b:filename
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    execute "tnoremap <buffer> <Leader>q <C-\\><C-n>:q<CR>"
    execute "normal \<C-h>"
  endif
endfunction

