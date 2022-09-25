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



"  Plug 'cgcoronel/simple-term.vim'
"so ~/.config/nvim/test.vim

" config """""""""""""""""" Simple terminal
"let g:simple_term_open = '<c-p>' 
"let g:simple_term_close = '<Leader>q' 

 """"""""""""""""""""""" Commands for development

" Run test in focus file   
cnoreabbrev te :call SimpleTerm('npx jest --watch ' . expand('%'), 0) 

" Run test in focus describe
cnoreabbrev td :call SimpleTerm('npx jest --watch -t "' . GetDescribe() . '" ' . expand('%'), 0) 

" Run test in focus it 
cnoreabbrev ti :call SimpleTerm('npx jest --watch -t "' . GetFullDescribe() . '" ' . expand('%'), 0) 


