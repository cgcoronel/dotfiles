" Get description from describe cursor focus 
function! GetDescribe() abort
  let line = search('describe(', 'b')
  let description = matchstr(getline(line), "'.*.'")

  if line
    return substitute(description, "'", '', 'g') 
  endif
  return ''
endfunction

" Get description from it cursor focus 
function! GetIt() abort
  let line = search('it(', 'b')
  let description = matchstr(getline(line), "'.*.'")

  if line
    return substitute(description, "'", '', 'g') 
  endif
  return ''
endfunction

" Get describe description and it description concat
function! GetFullDescribe() abort
  let it = GetIt()
  let describe = GetDescribe()
  return  describe . ' ' . it 
endfunction
