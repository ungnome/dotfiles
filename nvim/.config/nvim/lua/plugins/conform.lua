return {
    "stevearc/conform.nvim",
    opts = {
        log_level = vim.log.levels.DEBUG,
        formatters_by_ft = {
            bash = { lsp_format = "prefer" },
            sh = { lsp_format = "prefer" },
            go = { lsp_format = "prefer" },
            lua = { "stylua" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            yaml = { "prettierd", "prettier", stop_after_first = true },
            json = { "prettierd", "prettier", stop_after_first = true },
            jsonc = { "prettierd", "prettier", stop_after_first = true },
            svelte = { "prettierd", "prettier", stop_after_first = true },
            terraform = { lsp_format = "prefer" },
        },
    },
}
