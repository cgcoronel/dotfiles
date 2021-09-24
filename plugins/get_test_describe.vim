function! GetDescribe() abort
 let line = search('describe(', 'b')
 let describe = getline(line)
 let description = matchstr(getline(line), "'.*.'")

  if line
    return substitute(description, "'", '', 'g') 
  endif
  return ''
endfunction

function! GetIt() abort
 let line = search('it(', 'b')
 let it = getline(line)
 let description = matchstr(getline(line), "'.*.'")

  if line
    return substitute(description, "'", '', 'g') 
  endif
  return ''
endfunction

function! GetFullName() abort
  let it = GetIt()
  let describe = GetDescribe()

  return  describe . ' ' . it 
endfunction

