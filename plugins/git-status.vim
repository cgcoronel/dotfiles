autocmd VimEnter,BufEnter,ShellCmdPost *
  \ let b:git_branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
 
" Return branch name
function! StatuslineGit()
  let l:branchname = get(b:, 'git_branch', '') 
  return strlen(l:branchname) > 0?'⎇  '.l:branchname:''
endfunction
