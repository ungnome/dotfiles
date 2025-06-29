return {
    "catppuccin/nvim",
    tag = "stable",
    name = "catppuccin",
    enabled = true,
    lazy = false,
    priority = 1000,
    opt = {
        flavour = "auto",
        background = {
            light = "latte",
            dark = "mocha",
        },
        term_colorrs = true,
        dim_inactive = {
            enable = true,
            shade = "dark",
            percentage = 0.30,
        },
        show_end_of_buffer = true,
        integrations = {
            treesitter = true,
            cmp = true,
            gitsigns = true,
            telescope = true,
            mason = true,
            which_key = true,
            lsp_trouble = true,
        },
        custom_highlights = function(colors)
            return {
                Comment = { fg = colors.overlay1 },
                LineNr = { fg = colors.overlay1 },
                ["@tag.attribute"] = { fg = colors.yellow },
            }
        end,
    },
    config = function()
        vim.cmd("colorscheme catppuccin")
    end,
}
