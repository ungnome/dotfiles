return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        -- setup which-key
        local which_key = require("which-key")
        which_key.setup()

        which_key.add({
            { "<leader>b", desc = "+Buffers" },
            { "<leader>c", desc = "+Code" },
            { "<leader>f", desc = "+File" },
            { "<leader>s", desc = "+Search" },
            { "<leader>v", desc = "+Vim" },
        })
    end,
}
