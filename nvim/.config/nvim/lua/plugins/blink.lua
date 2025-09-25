return {
    "saghen/blink.cmp",
    -- enabled = false,
    version = "1.*",
    dependencies = { { "echasnovski/mini.nvim" } },
    opts = {
        keymap = { preset = "default" },

        -- fuzzy = {
        --     sorts = {
        --         "kind",
        --         "label",
        --     },
        -- },

        appearance = {
            nerd_font_variant = "normal",
        },

        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 500 },
            menu = {
                draw = {
                    columns = {
                        { "label" },
                        { "kind_icon", "kind" },
                        { "source_id" },
                    },
                },
            },
        },

        signature = { enabled = true },
    },
}
