-- https://github.com/echasnovski/mini.nvim

return {
  "echasnovski/mini.nvim",
  name = "mini",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  -- dependencies = {
  --   "JoosepAlviste/nvim-ts-context-commentstring",
  -- },
  config = function()
    require("mini.indentscope").setup({
      symbol = "│",
      draw = {
        animation = require('mini.indentscope').gen_animation.none()
      }
    })

    require("mini.surround").setup()
  end,
}
