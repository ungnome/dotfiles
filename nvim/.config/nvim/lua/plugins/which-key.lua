return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        -- setup which-key
        local which_key = require("which-key")
        which_key.setup({
            preset = "modern",
            icons = {
                mappings = false,
            },
        })

        which_key.add({
            { "<leader>f", desc = "+Find" },
            { "<leader>g", desc = "+Git" },
            { "<leader>s", desc = "+Search" },
            { "<leader>x", desc = "+Misc" },
        })
    end,
}
