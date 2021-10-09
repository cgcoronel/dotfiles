autocmd VimEnter,BufEnter,ShellCmdPost *
  \ let b:git_branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
 
""autocmd VimEnter,BufEnter,FocusGained,BufWritePost *
""  \ let b:git_clean = system("git diff --stat | tail -n1 | HEAD 2>/dev/null | tr -d '\n'")

" Return branch name
function! StatuslineGit()
  let l:branchname = get(b:, 'git_branch', '') 
  return strlen(l:branchname) > 0?'⎇  '.l:branchname:''
endfunction


" Return branch status 
""function! StatuslineBranch()
""  let l:status = get(b:, 'git_clean', '') 
""  let l:branchname = get(b:, 'git_branch', '') 
""
""  let l:bar = substitute(l:status, ' ', '', 'g')
""  let l:bar = substitute(l:bar, 'changed', '~ ', 'g')
""  let l:bar = substitute(l:bar, 'insertion', '+ ', 'g')
""  let l:bar = substitute(l:bar, 'deletion', '- ', 'g')
""  let l:bar = substitute(l:bar, 'file', '', 'g')
""  let l:bar = substitute(l:bar, ',', '', 'g')
""  let l:bar = substitute(l:bar, '(+)', '', 'g')
""  let l:bar = substitute(l:bar, '(-)', '', 'g')
""  let l:bar = substitute(l:bar, 's', '', 'g')
""
"" return strlen(l:branchname) > 0?l:bar:''
""endfunction
