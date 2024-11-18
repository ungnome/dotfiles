-- https://github.com/nvim-telescope/telescope.nvim
return {
	"nvim-telescope/telescope.nvim",
	name = "telescope",
	cmd = "Telescope",
	keys = {
		{
			"<leader>fg",
			":Telescope git_files<cr>",
			mode = "n",
			desc = "Fine Files (git)",
			silent = true,
		},
		{
			"<leader>ff",
			":Telescope find_files<cr>",
			mode = "n",
			desc = "Find Files (cwd)",
			silent = true,
		},
		{
			"<leader>cs",
			":Telescop lsp_document_symbols<cr>",
			mode = "n",
			desc = "Buffer Symbols",
			silent = true,
		},
		{
			"<leader>sg",
			":Telescope live_grep<cr>",
			mode = "n",
			desc = "Live Grep",
			silent = true,
		},
		{
			"<leader>bs",
			":Telescope buffers<cr>",
			mode = "n",
			desc = "Switch Buffers",
			silent = true,
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		defaults = {
			initial_mode = "insert",
			layout_config = {
				vertical = { width = 0.99 },
				horizontal = { width = 0.99 },
			},
		},
		pickers = {
			find_files = {
				find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")

		telescope.setup(opts)
		telescope.load_extension("fzf")
	end,
}
