require("ungnome.core.options")
require("ungnome.core.keymaps")
require("ungnome.core.autocmds")
require("ungnome.core.filetypes")

-- init lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load lazy.nvim
require("lazy").setup("ungnome.plugins", {
  defaults = {
    lazy = true,
  },
  install = {
    missing = true,
  },
  ui = {
    border = "single",
  },
})
