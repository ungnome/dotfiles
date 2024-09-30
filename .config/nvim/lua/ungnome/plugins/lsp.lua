return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>m", ":Mason<cr>", mode = "n", desc = "Mason", silent = true },
	},
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" }
	},
	config = function()
		-- install LSPs and tools
		require("mason").setup()
		require("mason-lspconfig").setup({
			-- lsp servers from lspconfig list
			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"svelte",
				"bashls",
				"html",
				"cssls",
				"tailwindcss",
				"dockerls",
				"docker_compose_language_service",
				"jsonls",
				"yamlls",
				"taplo",
				"marksman",
				"pyright",
				"gopls",
				"emmet_language_server",
				"terraformls",
			}
		})
		require("mason-tool-installer").setup({
			auto_update = true,
			run_on_start = true,
			ensure_installed = {
				-- these are tools not available in lspconfig repo
				"prettierd",
				"eslint_d",
				"stylua",
				"shfmt"
			}
		})
		vim.cmd(":MasonToolsUpdate")

		-- setup LSPs
		require("mason-lspconfig").setup_handlers {
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup {
					capabilities = require('cmp_nvim_lsp').default_capabilities()
				}
			end,
			-- Next, you can provide a dedicated handler for specific servers.
			-- For example, a handler override for the `rust_analyzer`:
			-- ["rust_analyzer"] = function ()
			-- 	require("rust-tools").setup {}
			-- end
		}
	end
}
