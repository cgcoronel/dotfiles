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

" TODO REFACTOR!!!!!!!!!!!!!!!!!!!!
let bar = substitute(l:branchname, ' ', '', 'g')

let bar1 = substitute(l:bar, 'changed', '~ ', 'g')
let bar2 = substitute(l:bar1, 'insertion', '+ ', 'g')
let bar3 = substitute(l:bar2, 'deletion', '- ', 'g')

let bar4 = substitute(l:bar3, 'file', '', 'g')
let bar5 = substitute(l:bar4, ',', '', 'g')
let bar6 = substitute(l:bar5, '(+)', '', 'g')
let bar7 = substitute(l:bar6, '(-)', '', 'g')
let bar8 = substitute(l:bar7, 's', '', 'g')

 return strlen(l:bar8) > 0?l:bar8:''
endfunction



