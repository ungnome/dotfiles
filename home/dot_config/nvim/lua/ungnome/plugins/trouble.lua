-- https://github.com/folke/trouble.nvim

return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = {
    use_diagnostic_signs = true,
    icons = true,
    auto_close = true,
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

