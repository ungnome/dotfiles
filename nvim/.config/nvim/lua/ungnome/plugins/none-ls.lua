return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.terraform_fmt,
                null_ls.builtins.diagnostics.terraform_validate,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.gofmt,
            },
        })

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            group = vim.api.nvim_create_augroup("RestartPrettierd", { clear = true }),
            pattern = "*prettier*",
            callback = function()
                vim.fn.system("prettierd restart")
            end,
        })
    end,
}
