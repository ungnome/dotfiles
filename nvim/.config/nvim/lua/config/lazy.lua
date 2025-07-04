-- init lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
require("lazy").setup("plugins", {
    defaults = {
        -- lazy = true,
        version = "*", -- default to latest stable version of plugins
    },
    install = {
        missing = true,
    },
    ui = {
        border = "rounded",
    },
})
