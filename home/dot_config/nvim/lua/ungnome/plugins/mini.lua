-- https://github.com/echasnovski/mini.nvim

return {
  "echasnovski/mini.nvim",
  name = "mini",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("mini.comment").setup({
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring()
            or vim.bo.commentstring
        end,
      },
    })

    require("mini.pairs").setup()

    require("mini.indentscope").setup({
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    })
    require("mini.surround").setup()
  end,
}
