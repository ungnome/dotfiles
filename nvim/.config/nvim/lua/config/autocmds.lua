-- Highlight on yank ----------------------------------------------------------
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
    command = "setlocal commentstring=#%s",
})
