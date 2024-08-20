-- https://github.com/catppuccin/nvim
return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	enabled = true,
	priority = 1000,
	dependencies = {
		{ "f-person/auto-dark-mode.nvim" },
	},
	opts = {
		flavour = "mocha",
		background = {
			light = "latte",
			dark = "mocha",
		},
		show_end_of_buffer = true,
		integrations = {
			treesitter = true,
			cmp = true,
			gitsigns = true,
			telescope = true,
			mason = true,
			mini = true,
			which_key = true,
			lsp_trouble = true,
		},
		custom_highlights = function(colors)
			return {
				Comment = { fg = colors.overlay1 },
				LineNr = { fg = colors.overlay1 },
			}
		end,
	},
	config = function(_, opts)
		-- setup catppuccin
		require("catppuccin").setup(opts)

		-- setup auto-dark-mode
		require("auto-dark-mode").setup({
			update_interval = 1000,
			set_dark_mode = function()
				vim.api.nvim_set_option("background", "dark")
				vim.cmd("colorscheme catppuccin-mocha")
			end,
			set_light_mode = function()
				vim.api.nvim_set_option("background", "light")
				vim.cmd("colorscheme catppuccin-latte")
			end,
		})
		-- vim.cmd("colorscheme catppuccin")
	end,
}
