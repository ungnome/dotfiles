return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { { "echasnovski/mini.nvim" } },
    opts = {
        keymap = { preset = "default" },
        appearance = {
            nerd_font_variant = "normal",
        },
        completion = {
            menu = {
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind" },
                    },
                },
            },
        },
    },
}
