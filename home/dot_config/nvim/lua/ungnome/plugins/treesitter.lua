-- https://github.com/nvim-treesitter/nvim-treesitter

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	opts = {
		highlight = { enable = true },
		indent = { enable = true, disable = { "python" } },
		context_commentstring = { enable = true, enable_autocmd = false },
		ensure_installed = {
			"bash",
			"c",
			"css",
			"go",
			"hcl",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"svelte",
			"toml",
			"tsx",
			"terraform",
			"typescript",
			"vim",
			"vue",
			"yaml",
		},
		autotag = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
