-- https://github.com/f-person/auto-dark-mode.nvim

return {
  enabled = true,
  event = "VeryLazy",
  "f-person/auto-dark-mode.nvim",
  opts = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.api.nvim_set_option("background", "dark")
      vim.cmd("colorscheme tokyonight-night")
    end,
    set_light_mode = function()
      vim.api.nvim_set_option("background", "light")
      vim.cmd("colorscheme catppuccin-latte")
    end,
  },
  init = function()
    require("auto-dark-mode").init()
  end

}
