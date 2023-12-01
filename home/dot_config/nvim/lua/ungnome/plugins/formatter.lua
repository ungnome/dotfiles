-- https://github.com/mhartington/formatter.nvim
return {
	"mhartington/formatter.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				javascript = { require("formatter.filetypes.javascript").prettierd },
				typescript = { require("formatter.filetypes.typescript").prettierd },
				lua = { require("formatter.filetypes.lua").stylua },
				json = { require("formatter.filetypes.json").prettierd },
				yaml = { require("formatter.filetypes.yaml").prettierd },
				svelte = { require("formatter.defaults").prettierd },
				toml = { require("formatter.filetypes.toml").taplo },
				terraform = { require("formatter.filetypes.terraform").terraformfmt },
				html = { require("formatter.filetypes.html").prettierd },
				sh = { require("formatter.filetypes.sh").shfmt },
				go = { require("formatter.filetypes.go").gofmt },
				markdown = { require("formatter.defaults").prettierd },
			},
		})
	end,
}
