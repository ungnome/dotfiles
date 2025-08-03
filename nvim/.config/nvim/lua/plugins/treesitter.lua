-- https://github.com/nvim-treesitter/nvim-treesitter

return {
    -- enabled = false,
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true, disable = { "python" } },
        context_commentstring = { enable = true, enable_autocmd = false },
        ensure_installed = {
            "bash",
            "css",
            "go",
            "hcl",
            "html",
            "javascript",
            "json",
            "python",
            "regex",
            "svelte",
            "toml",
            "tsx",
            "terraform",
            "typescript",
            "vue",
            "yaml",
            -- these are included with neovim, however, they don't work with treesitter installed parsers
            -- sudo m /usr/local/Cellar/neovim/0.9.5/lib/nvim/parser/{c,lua,query,vim,vimdoc}.so
            "c",
            "lua",
            "query",
            "vim",
            "vimdoc",
        },
        autotag = {
            enable = true,
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
