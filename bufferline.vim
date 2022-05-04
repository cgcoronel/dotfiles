""""""""""""""""""" Buffer list
function! BufferList(p = 'n')
    if a:p == 'n' 
      :silent bnext
    else
      :silent bprevious
    endif

    let l:blist = getbufinfo()
    let bar = 'Buf> '

    for l:item in l:blist
        if l:item.listed == 0 | continue | endif

        let array = split(l:item.name, '/')

        let name = ''
        if len(array) > 0 || index(tabpagebuflist(), l:item.bufnr) > 0 
          let name = array[-1]
        else
          continue
        endif  

        if name == 'NERD_tree_1' || name == 'index'
          continue
        endif

        if expand('%:t') == name
          let bar = bar . '[' . name . ']'
        else
          let bar = bar . ' ' . name . ' '
        endif
    endfor

    echo bar 
endfunction
