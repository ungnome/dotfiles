local opt = vim.opt
local global = vim.g

-- map leader to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- indent
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 4
opt.shiftround = true
opt.tabstop = 4
opt.expandtab = true

-- cursor and position indicators
opt.cursorline = true
opt.colorcolumn = "80"
opt.mouse = "a"
opt.number = true
opt.relativenumber = true

-- context
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.wrap = false
opt.signcolumn = "yes"
opt.listchars = "space:·,tab:> ,eol:$"

-- completion menu
opt.completeopt = "menu,menuone,preview,noinsert"

-- confirm changes before closing buffer
opt.confirm = true

-- search and spelling
opt.ignorecase = true
opt.smartcase = true
opt.spelllang = { "en" }

-- split behavior
opt.splitbelow = true
opt.splitright = true

-- misc
opt.shortmess:append({ C = true })
global.skip_ts_context_commentstring_module = true
opt.winborder = "rounded"
