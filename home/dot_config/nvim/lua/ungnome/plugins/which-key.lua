return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		-- setup which-key
		local which_key = require("which-key")
		which_key.setup()

		-- define keymaps
		local menu = {
			mode = { "n" },
			["<leader>b"] = "Buffers",
			["<leader>c"] = "Code",
			["<leader>f"] = "File",
			["<leader>q"] = "Quit",
			["<leader>s"] = "Search",
			["<leader>u"] = "UI",
			["<leader>w"] = "Window",
		}

		-- add custom menu items to which-key
		which_key.register(menu)
	end,
}
