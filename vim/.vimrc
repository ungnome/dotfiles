
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
set mouse=a
set number
set relativenumber


" -- context --
set scrolloff=10
set sidescrolloff=10
set nowrap
set signcolumn=yes
set listchars=space:\·,tab:>\ ,eol:$

" --  menu --
set completeopt=menu,menuone,preview,noinsert
set wildmenu wildoptions=pum

" -- confirm before closing buffer --
set confirm

" -- search and spelling -- 
set ignorecase
set smartcase
set spelllang=en
set hlsearch
set incsearch

" -- split behavior --
set splitbelow
set splitright

" -- colors -- 
set termguicolors


" -- keymaps --
" move up and down by display lines, handles wrapped lines better
nnoremap j gj
nnoremap k gk
" CTRL+[h|j|k|l] to switch windows in normal mode
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
" clear search highlights with ESC 
nnoremap <silent> <esc> :noh<cr><esc>
" ALT+[h,j,k,l] to resize windows in normal mode
nnoremap <A-l> <C-w><
nnoremap <A-h> <C-w>>
nnoremap <A-k> <C-w>+
nnoremap <A-j> <C-w>-

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

