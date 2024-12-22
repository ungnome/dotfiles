vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- indent
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 4
opt.shiftround = true
opt.tabstop = 4

-- cursor and position indicators
opt.cursorline = true
opt.colorcolumn = "100"
opt.mouse = "a"
opt.number = true
opt.relativenumber = true

-- context
opt.scrolloff = 10
opt.sidescrolloff = 10
opt.wrap = false
opt.signcolumn = "yes"
opt.listchars = "space:·,tab:>-"

-- enable truecolor support
-- opt.termguicolors = true

-- completion menu
opt.completeopt = "menu,menuone,preview,noinsert"
opt.pumheight = 10

-- confirm changes before closing buffer
opt.confirm = true

-- search and spelling
opt.ignorecase = true
opt.smartcase = true
opt.spelllang = { "en" }

-- split behavior
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- misc
opt.shortmess:append({ C = true })
