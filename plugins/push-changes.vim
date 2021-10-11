" git push --set-upstream origin [branchname] 
function! PushChanges()
  echo('Pushing changes...')

  let s:cmd='git push' 
  let l:output = system(s:cmd)

  if l:output[0:24] == 'fatal: The current branch'
    let l:branchname = get(b:, 'git_branch', '') 
    let s:cmd = 'git push --set-upstream origin ' . l:branchname 
    let l:output = system(s:cmd)
  endif

  echo(": " . s:cmd)
  echo(l:output)
endfunction

