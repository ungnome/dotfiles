-- https://github.com/nvim-lualine/lualine.nvim

return {
	enabled = true,
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			globalstatus = true,
			component_separators = "",
			section_separators = "",
			disabled_filetypes = {
				statusline = {
					"dashboard",
					"lazy",
					"alpha",
				},
				winbar = {
					"neo-tree",
				},
			},
		},

		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				{
					"filename",
					file_status = true,
					newfile_status = true,
					path = 1,
				},
			},
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},

		extensions = {
			"neo-tree",
		},
	},
}
