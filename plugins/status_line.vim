
" Show mode
"set noshowmode
"let ctrlv = "\<C-v>"
"set statusline+=%#DiffAdd#%{(mode()==ctrlv)?'\ \ V-BLOCK\ ':''}
"set statusline+=%#QuickFixLine#%{(mode()=='n')?'\ \ NORMAL\ ':''}
"set statusline+=%#DiffAdd#%{(mode()=='i')?'\ \ INSERT\ ':''}
"set statusline+=%#DiffDelete#%{(mode()=='R')?'\ \ REPLACE\ ':''}
"set statusline+=%#IncSearch#%{(mode()=='v')?'\ \ VISUAL\ ':''}
"set statusline+=%#QuickFixLine#%{(mode()=='t')?'\ \ TERMINAL\ ':''}
"set statusline+=%#DiffDelete#%{(mode()=='c')?'\ \ COMMAND\ ':''}

"""""""""""""""" statusline
set statusline+=%#StatusBar#\ %f\ \ %m

" Right side settings
set statusline+=%=\ %l/%L,%c\ 


"""""""""""""""" full statusline
"set statusline+=%#FoldColumn#
"set statusline+=\ \ %f\ %m
"
"set statusline+=%=" Right side settings
"set statusline+=%{StatuslineGit()} " git branch
"
"" info file
"set statusline+=\ %#PmenuThumb#
"set statusline+=\ %p%%
"set statusline+=\ \ Ξ
"set statusline+=\ %l/%L
"set statusline+=\ ㏑
"set statusline+=\ %c
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding} 
"set statusline+=\ \  
