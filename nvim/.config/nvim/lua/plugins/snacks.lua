return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        { "<leader>p",  function() Snacks.picker() end,                       desc = "Pickers" },
        { "<leader>e",  function() Snacks.picker.explorer() end,              desc = "File Explorer" },
        { "<leader>n",  function() Snacks.picker.notifications() end,         desc = "Notification History" },

        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end,               desc = "Buffers" },
        { "<leader>ff", function() Snacks.picker.files() end,                 desc = "Find Files (cwd)" },
        { "<leader>fg", function() Snacks.picker.git_files() end,             desc = "Find Files (git)" },

        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end,          desc = "Git Branches" },
        { "<leader>gl", function() Snacks.picker.git_log() end,               desc = "Git Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end,          desc = "Git Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end,            desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end,             desc = "Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end,              desc = "Git Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end,          desc = "Git Log File" },

        -- search
        { '<leader>s"', function() Snacks.picker.registers() end,             desc = "Registers" },
        { "<leader>sd", function() Snacks.picker.diagnostics_buffer() end,    desc = "Buffer Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
        { "<leader>sh", function() Snacks.picker.help() end,                  desc = "Help Pages" },
        { "<leader>sH", function() Snacks.picker.highlights() end,            desc = "Highlights" },
        { "<leader>su", function() Snacks.picker.undo() end,                  desc = "Undo History" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

        -- lsp
        { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
        { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
        {
            "gr",
            function() Snacks.picker.lsp_references() end,
            nowait = true,
            desc = "References",
        },
        { "gI", function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    },
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },

        picker = {
            sources = {
                explorer = {
                    layout = "select",
                    jump = { close = true },
                },
                files = {
                    hidden = true,
                },
            },
        },
    },
}
