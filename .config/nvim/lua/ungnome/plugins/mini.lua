-- https://github.com/echasnovski/mini.nvim

return {
	"echasnovski/mini.nvim",
	name = "mini",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("mini.surround").setup()
	end,
}

