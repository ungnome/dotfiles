function has_value(tab, val)
    for index, value in pairs(tab) do
        if value == val then return true end
    end

    return false
end

return {
    "mason-org/mason.nvim",
    config = function()
        require("mason").setup({})

        local ensure_installed = {
            "bash-language-server",
            "emmet-language-server",
            "lua-language-server",
            "marksman",
            "svelte-language-server",
            "tailwindcss-language-server",
            "terraform-ls",
            "typescript-language-server",
            "css-lsp",
            "html-lsp",
            "json-lsp",
            "yaml-language-server",
            "eslint_d",
            "prettierd",
            "gopls",
        }

        local installed = require("mason-registry").get_installed_package_names()
        local missing = {}

        for i, tool in pairs(ensure_installed) do
            if not has_value(installed, tool) then table.insert(missing, tool) end
        end

        if #missing > 0 then
            local cmd = string.format(":MasonInstall %s", table.concat(missing, " "))
            vim.cmd(cmd)
        end
    end,
}
