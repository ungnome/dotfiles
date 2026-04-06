local opt = vim.opt
local global = vim.g

-- neovim specific options
opt.shortmess:append({ C = true })
global.skip_ts_context_commentstring_module = true
opt.winborder = "rounded"
