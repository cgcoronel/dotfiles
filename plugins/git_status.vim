autocmd BufEnter,ShellCmdPost *
  \ let b:git_branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
 
autocmd BufEnter,FocusGained,BufWritePost *
  \ let b:git_clean = system("git diff --stat | tail -n1 | HEAD 2>/dev/null | tr -d '\n'")

" Return branch name
function! StatuslineGit()
  let l:branchname = get(b:, 'git_branch', '') 
  return strlen(l:branchname) > 0?'⎇  '.l:branchname:''
endfunction


" Return branch status 
function! StatuslineBranch()
  let l:branchname = get(b:, 'git_clean', '') 
let bar = substitute(l:branchname, ' files changed,', '~', '')
let bar1 = substitute(l:bar, ' insertions(+),', '+', '')
let bar2 = substitute(l:bar1, ' insertion(+),', '+', '')
let bar3 = substitute(l:bar2, ' deletion(-)', "-", '')
let bar4 = substitute(l:bar3, ' deletions(-)', '-', '')
let bar5 = substitute(l:bar4, ' file changed,', '~', '')

 return strlen(l:bar5) > 0?l:bar5:''
endfunction



