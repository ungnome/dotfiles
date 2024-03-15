return {
	lazy = false,
	enabled = true,
	"Mofiqul/dracula.nvim",
	opts = {
		colors = {
			bg = "#121212",
		},
	},
	config = function(_, opts)
		require("dracula").setup(opts)
		vim.cmd.colorscheme("dracula")
	end,
}
