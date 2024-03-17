return {
	lazy = false,
	enabled = true,
	"Mofiqul/dracula.nvim",
	config = function()
		local colors = require("dracula").colors()

		require("dracula").setup({
			colors = {
				bg = "#23252F",
			},
			show_end_of_buffer = true,
			overrides = {
				EndOfBuffer = { fg = colors.purple },
			},
		})

		vim.cmd.colorscheme("dracula")
	end,
}
