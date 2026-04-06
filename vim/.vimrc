
" -- indentation --
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set shiftround
set expandtab 

" -- cursor and position indicators --
set cursorline
set colorcolumn=100
set mouse="a"
set number
set relativenumber


" -- context --
set scrolloff=10
set sidescrolloff=10
set nowrap
set signcolumn=yes
set listchars="space:·,tab:> ,eol:$"

" -- completion menu --
set completeopt="menu,menuone,preview,noinsert"

" -- confirm before closing buffer --
set confirm

" -- search and spelling -- 
set ignorecase
set smartcase
set spelllang="en"

" -- split behavior --
set splitbelow
set splitright

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


" -- colors -- 
set termguicolors

