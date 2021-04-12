" Return branch name
function! StatuslineGit()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0?l:branchname:''
endfunction


" Close each buffer and close vim 
function! CloseFile()
     if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
         :q 
     else
         :bdelete
     endif
endfunction

" git push --set-upstream origin [branchname] 
function! PushChanges()
    echo('Pushing changes...')

    let s:cmd='git push' 
    let l:output = system(s:cmd)

    "check add origin
    if l:output[0:24] == 'fatal: The current branch'

      "get branchname
      let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
      
      "set command
      let s:cmd = 'git push --set-upstream origin ' . l:branchname 

      let l:output = system(s:cmd)
      
    endif

    echo(": " . s:cmd)
    echo(l:output)
endfunction

" Run test in focus file   
function! RunTest()
    echo('Running unit test...')

    "get filename
    let b:filename=expand('%')

    vsplit
    execute "normal \<C-l>"
    execute "term npm run test:watch " . b:filename
    execute "set nonu"
    execute "set nornu"
    execute "normal \<C-h>"
endfunction


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
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-k> <C-\\><C-n><C-w><C-k>"
    execute "tnoremap <buffer> <C-j> <C-\\><C-n><C-w><C-j>"
    execute "tnoremap <buffer> <C-l> <C-\\><C-n><C-w><C-l>"

    execute "tnoremap <buffer> <Leader>t <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction

