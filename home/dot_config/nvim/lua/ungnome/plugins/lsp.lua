-- https://github.com/VonHeikemen/lsp-zero.nvim
return {
	"VonHeikemen/lsp-zero.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = "Mason",
	branch = "v2.x",
	keys = {
		{ "<leader>m", ":Mason<cr>", mode = "n", desc = "Mason", silent = true },
		{
			"<leader>ca",
			":lua vim.lsp.buf.code_action()<cr>",
			mode = "n",
			desc = "Code Actions",
			silent = true,
		},
		{
			"<leader>cr",
			":lua vim.lsp.buf.rename()<cr>",
			mode = "n",
			desc = "Rename",
			silent = true,
		},
	},
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },

		-- Mason
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
			opts = {
				ui = {
					border = "single",
				},
			},
		},
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "hrsh7th/cmp-buffer" }, -- Optional
		{ "hrsh7th/cmp-path" }, -- Optional
		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		{ "hrsh7th/cmp-nvim-lua" }, -- Optional

		-- Snippets
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "rafamadriz/friendly-snippets" }, -- Optional
	},
	config = function()
		local lsp = require("lsp-zero").preset({
			name = "recommended",
			manage_nvim_cmp = {
				set_extra_mappings = true,
			},
		})
		local lspconfig = require("lspconfig")

		require("mason-tool-installer").setup({
			auto_update = true,
			run_on_start = true,
			start_delay = 0,
			debounce_hours = nil,
			ensure_installed = {
				"typescript-language-server",
				"terraform-ls",
				"svelte-language-server",
				"lua-language-server",
				"bash-language-server",
				"dockerfile-language-server",
				"html-lsp",
				"json-lsp",
				"yaml-language-server",
				"marksman",
				"pyright",
				"tailwindcss-language-server",
				"taplo",
				"prettierd",
				"eslint_d",
				"stylua",
				"shfmt",
				"gopls",
				"emmet-language-server",
			},
		})

		-- configure lsp server's settings
		lspconfig.yamlls.setup({
			settings = {
				yaml = {
					keyOrdering = false,
				},
			},
		})

		-- setup/start lsp-zero
		lsp.setup()

		local cmp = require("cmp")

		cmp.setup({
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			},
		})
	end,
}
