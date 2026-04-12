-------------------------------------------------------------------------------
-- load options supported in both vim and neovim from vimrc
-------------------------------------------------------------------------------
vim.cmd("source ~/.vimrc")


-------------------------------------------------------------------------------
-- local vars for use later on
-------------------------------------------------------------------------------
local opt = vim.opt
local global = vim.g
local map = vim.keymap.set
local lsp = vim.lsp

-------------------------------------------------------------------------------
-- install plugins
-------------------------------------------------------------------------------
vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
})

-------------------------------------------------------------------------------
-- options
-------------------------------------------------------------------------------
opt.winborder = "single"

-------------------------------------------------------------------------------
-- keymaps
-------------------------------------------------------------------------------
-- files
map("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "File Explorer", silent = true })

-- code
map("n", "<F2>", function() lsp.buf.rename() end, { desc = "Rename Symbol", silent = true })
map("n", "<F3>", function() require("conform").format() end, { desc = "Format Buffer", silent = false })
-- map({ "n", "i", "s" }, "<C-s>", vim.lsp.buf.signature_help, { desc = "Show Signature help" })
map("n", "grd", ":lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition", silent = true })

-- find
map("n", "<leader>ff", ":Pick files<CR>", { desc = "Files (cwd)", silent = true })
map("n", "<leader>fg", ":Pick git_files<CR>", { desc = "Files (git)", silent = true })
map("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Buffers", silent = true })

-- search
map("n", "<leader>sg", ":Pick grep<CR>", { desc = "Grep", silent = true })
map("n", "<leader>sh", ":Pick help<CR>", { desc = "Help", silent = true })
map("n", "<leader>sk", ":Pick keymaps<CR>", { desc = "Keybinds", silent = true })
map("n", "<leader>ss", ":Pick lsp scope='document_symbol'<CR>", { desc = "Buffer Symbols", silent = true })
map("n", "<leader>sS", ":Pick lsp scope='workspace_symbol'<CR>", { desc = "Workspace Symbols", silent = true })
map("n", "<leader>n", function() MiniNotify.show_history() end, { desc = "Notification", silent = true })

-- diagnostics
map("n", "<leader>x", vim.diagnostic.open_float, { desc = "Show Diagnostics" })

-------------------------------------------------------------------------------
-- autocmds
-------------------------------------------------------------------------------
-- Highlight on yank 
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", {}),
    desc = "Hightlight selection on yank",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- use tree-sitter highlighting rather than lsp
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
    end,
})

-- SaltStack
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.sls",
    command = "set ft=salt expandtab shiftwidth=2 tabstop=2",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.tf",
    command = "setlocal commentstring=#%s; | set ft=terraform",
})

