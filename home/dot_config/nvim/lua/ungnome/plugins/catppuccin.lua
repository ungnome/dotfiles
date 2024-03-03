-- https://github.com/catppuccin/nvim
return {
	lazy = false,
	enabled = false,
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
		flavour = "mocha",
		background = {
			light = "macchiato",
			dark = "mocha",
		},
		show_end_of_buffer = true,
		dim_inactive = {
			enabled = true,
			shade = "light",
			percentage = 0.35,
		},
		integrations = {
			treesitter = true,
			cmp = true,
			gitsigns = true,
			telescope = true,
			mason = true,
			mini = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			which_key = true,
			lsp_trouble = true,
		},
	},
	config = function(_, opts)
		-- setup catppuccin
		require("catppuccin").setup(opts)

		-- start catppuccin
		vim.cmd.colorscheme("catppuccin")
	end,
}
