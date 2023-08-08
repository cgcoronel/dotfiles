local M = {}

function M.setup()
  function Quit()
      local buffers = {}
      for i = 1, vim.fn.bufnr('$') do
          if vim.fn.buflisted(i) then
              table.insert(buffers, i)
          end
      end
  
      if #buffers == 1 then
          vim.cmd('q')
      else
          vim.cmd('bd')
      end
  end
  vim.keymap.set('n', '<Leader>q', ':lua Quit()<CR>', {})

  function fuzzy_find_files()
    require('telescope.builtin').find_files({
        find_command = {'rg', '--files', '--iglob', '!.git', '--hidden'},
        prompt_title = 'Fuzzy Find Files',
        hidden = true,
    })
  end
  vim.keymap.set('n', '<leader>f', '<cmd>lua fuzzy_find_files()<CR>', { noremap = true, silent = true })

  -- git fugitive
  vim.cmd([[
    augroup fugitive_mapping
      autocmd!
      autocmd filetype fugitive nmap <buffer> <nowait> <silent> ff dv :resize 100<CR>
      autocmd filetype fugitive nmap <buffer> <nowait> <silent> o gO <C-l>:q<CR>
    augroup END
  ]])

  vim.cmd('cnoreabbrev gco Git commit')
  vim.cmd('cnoreabbrev gpu Git push')
  vim.cmd('cnoreabbrev gbb Git blame ')

  -- coc
--  vim.cmd("let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-eslint', 'coc-json']")

  vim.keymap.set('i', 'kj', '<Esc>')
  vim.keymap.set('n', '<leader>w', ':w<CR>')
  vim.keymap.set('n', 'm', ':bprevious<CR>')
  vim.keymap.set('n', '.', ':bnext<CR>')

  -- move between windows
  vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
  vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
  vim.keymap.set('i', '<C-L>', '<Esc><C-W><C-L>')
  vim.keymap.set('i', '<C-H>', '<Esc><C-W><C-H>')
 
  -- auto close brackets
  vim.keymap.set('i', '(', '()<Esc>i')
  vim.keymap.set('i', '[', '[]<Esc>i')
  vim.keymap.set('i', '`', '``<Esc>i')
  vim.keymap.set('i', '"', '""<Esc>i')
  vim.keymap.set('i', '{', '{}<Esc>i')
  vim.keymap.set('i', "'", "''<Esc>i")
 
  -- move lines up and down
  vim.keymap.set('n', '<C-J>', "10j")
  vim.keymap.set('n', '<C-K>', "10k")
 
  -- move start and end of line
  vim.keymap.set('n', 'gl', "$")
  vim.keymap.set('n', 'gh', "0")
  vim.keymap.set('v', 'gl', "$")
  vim.keymap.set('v', 'gh', "0")
 
  -- clean search
  vim.keymap.set('n', '<leader><space>', ":noh<CR>")
 
  -- move lines up and down
  vim.keymap.set('n', '<S-j>', ':m .+1<CR>')
  vim.keymap.set('n', '<S-k>', ':m .-2<CR>')
 
  -- split buffer
  vim.keymap.set('n', 's', ':vsp<CR>')

  -- copy file path
  vim.keymap.set('n', 'cp', ':let @+ = expand("%")<CR>')
end

return M

