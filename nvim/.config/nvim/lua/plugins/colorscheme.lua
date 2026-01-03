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
                    base = "#1e1e1e",
                    mantle = "#1a1a1a",
                    crust = "#171717"
                },
            },
            term_colors = true,
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
                    ["@tag.attribute"] = { fg = colors.peach },

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
