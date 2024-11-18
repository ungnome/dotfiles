return {
	"catppuccin/nvim",
	name = "catppuccin",
	enabled = true,
	priority = 1000,
	opts = {
		flavour = "mocha",
		background = {
			light = "latte",
			dark = "mocha",
		},
		dim_inactive = {
			enable = true,
			shade = "dark",
			percentage = 0.30,
		},
		show_end_of_buffer = true,
		integrations = {
			treesitter = true,
			cmp = true,
			gitsigns = true,
			telescope = true,
			mason = true,
			which_key = true,
			lsp_trouble = true,
		},
		custom_highlights = function(colors)
			return {
				Comment = { fg = colors.overlay1 },
				LineNr = { fg = colors.overlay1 },
				["@tag.attribute"] = { fg = colors.yellow },
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd("colorscheme catppuccin")
	end,
}

