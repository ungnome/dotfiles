return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        image = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },

        picker = {
            enabled = true,
            layout = {
                preset = "telescope",
            },
            win = {
                input = {
                    keys = {
                        ["<c-y>"] = { "confirm", mode = { "n", "i" } },
                        ["<c-e>"] = { "cancel", mode = { "n", "i" } },
                    },
                },
                list = {
                    keys = {
                        ["<c-y>"] = "confirm",
                        ["<c-e>"] = "cancel",
                    },
                },
            },
        },
    },
}
