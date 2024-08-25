-- https://github.com/echasnovski/mini.nvim

return {
	enabled = false,
	"echasnovski/mini.nvim",
	name = "mini",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("mini.surround").setup()
	end,
}
