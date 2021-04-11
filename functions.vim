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
