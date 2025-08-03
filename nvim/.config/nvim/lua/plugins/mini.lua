return {
    "echasnovski/mini.nvim",
    version = false,
    dependencies = {
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            opt = {
                enable_autocmd = false,
            },
        },
    },
    config = function()
        require("mini.surround").setup({
            custom_surroundings = {
                T = {
                    input = { "<(%w+)[^<>]->.-</%1>", "^<()%w+().*</()%w+()>$" },
                    output = function()
                        local tag_name = MiniSurround.user_input("Tag name")
                        if tag_name == nil then return nil end
                        return { left = tag_name, right = tag_name }
                    end,
                },
            },
        })

        require("mini.pairs").setup()
        require("mini.comment").setup({
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
                end,
            },
        })

        require("mini.notify").setup()
        require("mini.icons").setup()
        require("mini.pick").setup()
        require("mini.extra").setup()

        -- replace default select ui with MiniPick
        vim.ui.select = MiniPick.ui_select
    end,
}
