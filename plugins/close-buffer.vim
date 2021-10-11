" Close each buffer and close vim 
function! CloseFile()
  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    :q 
  else
    :bdelete
  endif
endfunction

