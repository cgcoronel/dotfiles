return {
  "tpope/vim-fugitive",
  cmd = "Git",
  keys = {
    { "<leader>d", "<cmd>0Git<CR><cmd>6<CR>" },
  },

  init = function()
    vim.cmd("cnoreabbrev gco Git commit")
    vim.cmd("cnoreabbrev gpu Git push")
    vim.cmd("cnoreabbrev gbb Git blame --date short")

    vim.cmd([[
      function! OpenFileInCursor()
        let l:line = getline('.')
        let l:tokens = split(l:line)
        let l:file = ''
      
        for l:token in reverse(l:tokens)
          if l:token =~# '/'
            let l:file = l:token
            break
          endif
        endfor
      
        if filereadable(l:file)
          call system('cursor ' . shellescape(l:file))
        else
          echo 'Archivo no encontrado: ' . l:file
        endif
      endfunction      

      augroup fugitive_mapping
        autocmd!
        autocmd FileType fugitive nmap <buffer> <nowait> <silent> ff dv :resize 100<CR>
        autocmd FileType fugitive nnoremap <buffer> o :call OpenFileInCursor()<CR>
        autocmd FileType fugitive nmap <buffer> <nowait> <silent> a - 
      augroup END
    ]])
    -- autocmd FileType fugitive nmap <buffer> <nowait> <silent> o gO <C-l>:q<CR><C-h>
  end,
}
