" -- status line --
set laststatus=2 " enable status line

" this comes from https://shapeshed.com/vim-statuslines/
set statusline=""
set statusline+=\ %F
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c\ 

colorscheme catppuccin_mocha
syntax on
