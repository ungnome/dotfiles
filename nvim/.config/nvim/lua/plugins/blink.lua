return {
    "saghen/blink.cmp",
    enabled = true,
    version = "1.*",
    dependencies = { { "echasnovski/mini.nvim" } },
    opts = {
        keymap = { preset = "default" },
        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 500 },
            menu = {
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind", "source_name", gap = 1 },
                    },
                },
            },
        },
        signature = {
            enabled = true,
            window = {
                treesitter_highlighting = true,
                direction_priority = { "s", "n" },
            },
        },
    },
}
