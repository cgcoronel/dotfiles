" Open file test from current file
function! FindTestFiles()

  let s:file = '**/*test**/*' . expand('%:t')

  execute 'edit' s:file 

endfunction

