return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    branch = "main",
    config = function()
        require("catppuccin").setup({
            flavour = "auto",
            background = {
                light = "latte",
                dark = "mocha",
            },
            color_overrides = {
                mocha = {
                    text = "#dce0e8",
                },
            },
            term_colorrs = true,
            dim_inactive = {
                enable = true,
                shade = "dark",
                percentage = 0.30,
            },
            show_end_of_buffer = true,
            auto_integrations = true,
            custom_highlights = function(colors)
                return {
                    Comment = { fg = colors.overlay1 },
                    LineNr = { fg = colors.overlay1 },
                    ["@tag.attribute"] = { fg = colors.yellow },

                    -- -- blink.cmp
                    BlinkCmpMenu = { bg = colors.base },
                    BlinkCmpMenuBorder = { bg = colors.base, fg = colors.blue },
                    BlinkCmpDoc = { bg = colors.base },
                    BlinkCmpDocBorder = { bg = colors.base, fg = colors.blue },
                }
            end,
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
