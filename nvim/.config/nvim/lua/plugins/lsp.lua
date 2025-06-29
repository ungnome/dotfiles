return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    keys = {
        { "<leader>m", ":Mason<cr>", mode = "n", desc = "Mason", silent = true },
        { "<F2>", mode = "n", ":lua vim.lsp.buf.rename()<CR>", desc = "Rename Symbol", silent = true },
        { "<F3>", mode = "n", ":lua vim.lsp.buf.format()<CR>", desc = "Format Buffer", silent = true },
    },
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "nvim-lua/plenary.nvim" },
    },
    config = function()
        -- -------------------------------------------------------
        -- lsp server configs
        -- -------------------------------------------------------
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        local lsp_servers = {
            lua_ls = {},
            ts_ls = {},
            svelte = {},
            bashls = {},
            html = {},
            cssls = {},
            tailwindcss = {},
            dockerls = {},
            docker_compose_language_service = {},
            jsonls = {},
            yamlls = {},
            marksman = {},
            emmet_language_server = {},
            terraformls = {},
        }

        -- -------------------------------------------------------
        -- install LSPs
        -- -------------------------------------------------------
        local mason_ensure_installed = {}

        for name, opts in pairs(lsp_servers) do
            table.insert(mason_ensure_installed, name)
        end

        require("mason").setup({ ui = { border = "rounded" } })
        require("mason-lspconfig").setup({
            ensure_installed = mason_ensure_installed,
            automatic_enable = false,
        })
        require("mason-tool-installer").setup({
            -- these are tools not available in lspconfig repo
            auto_update = true,
            run_on_start = true,
            ensure_installed = {
                "prettierd",
                "eslint_d",
                "shfmt",
            },
        })

        vim.cmd(":MasonToolsUpdate")

        -- -------------------------------------------------------
        -- configure LSPs
        -- -------------------------------------------------------
        local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

        for name, opts in pairs(lsp_servers) do
            local server_config = vim.tbl_extend("force", {
                capabilities = default_capabilities,
            }, opts or {})

            vim.lsp.enable(name)
            vim.lsp.config(name, server_config)
        end
    end,
}
