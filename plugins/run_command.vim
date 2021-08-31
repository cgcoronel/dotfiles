" Open terminal and run command 
" param1 : command
" param2 : focus in terminal
"          0: false, 
"          null or 1: true  
function! RunCommand(command,...)
  let command = a:command
  let focus = get(a:, 1, 1) 

  echo('Running Command...' . command)

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

   if bufType == "terminal"

      " close existing terminal
      execute "q"

  else 

      vsp
      execute "normal \<C-l>\<C-l>\<C-l>"
      execute "term " . command
      execute "set nonu"
      execute "set nornu"

      " toggle insert on enter/exit
      silent au BufLeave <buffer> stopinsert!
      silent au BufWinEnter,WinEnter <buffer> startinsert!

      execute "tnoremap <buffer> <Leader>q <C-\\><C-n>:q<CR>"

      if (!focus)
         execute "normal \<C-h>"
      else
         execute "normal \<C-h>\<C-l>"
      endif

  endif
endfunction
