" git push --set-upstream origin [branchname] 
function! PushChanges()
  echo('Pushing changes...')

  let s:cmd='git push' 
  let l:output = system(s:cmd)

  "check add origin
  if l:output[0:24] == 'fatal: The current branch'
    "get branchname from buffer
    let l:branchname = get(b:, 'git_branch', '') 

    "set command
    let s:cmd = 'git push --set-upstream origin ' . l:branchname 

    "run command
    let l:output = system(s:cmd)
  endif

  echo(": " . s:cmd)
  echo(l:output)
endfunction

