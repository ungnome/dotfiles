-- https://github.com/folke/trouble.nvim

return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	keys = {
		{
			"<leader>cd",
			":TroubleToggle document_diagnostics<cr>",
			mode = "n",
			desc = "Code Diagnostics (Buffer)",
			silent = true,
		},
		{
			"<leader>cD",
			":TroubleToggle workspace_diagnostics<cr>",
			mode = "n",
			desc = "Code Diagnostics (Workspace)",
			silent = true,
		},
	},
	opts = {
		use_diagnostic_signs = true,
		icons = true,
		auto_close = true,
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
