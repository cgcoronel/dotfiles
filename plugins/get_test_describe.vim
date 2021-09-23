function! GetDescribe() abort
 let line = search('describe(', 'b')
 let describe = getline(line)
 let description = matchstr(getline(line), "'.*.'")

  if line
    return description 
  endif
  return ''
endfunction

