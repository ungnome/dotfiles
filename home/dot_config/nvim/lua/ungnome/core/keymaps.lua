local map = vim.keymap.set
local utils = require("ungnome.core.utils")

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Windows
map("n", "<leader>wv", ":vsplit<cr>", { desc = "Split Window Vertically", silent = true })
map("n", "<leader>wh", ":split<cr>", { desc = "Split Window Horizontally", silent = true })

-- lazy
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy", silent = true })

-- lsp
map("n", "<leader>m", ":Mason<cr>", { desc = "Mason", silent = true })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- files
map("n", "<leader>fe", ":Ex<cr>", { desc = "File Explorer", silent = true })
map("n", "<leader>fg", ":Telescope git_files<cr>", { desc = "Find Files (git)", silent = true })
map("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Find Files (cwd)", silent = true })

-- code
map("n", "<leader>cf", ":Format<cr>", { desc = "Format Buffer", silent = true })
map(
	"n",
	"<leader>cs",
	":Telescope lsp_document_symbols<cr>",
	{ desc = "Buffer Symbols", silent = true }
)
map(
	"n",
	"<leader>cd",
	":TroubleToggle document_diagnostics<CR>",
	{ desc = "Code Diagnostics (Buffer)", silent = true }
)
map(
	"n",
	"<leader>cD",
	":TroubleToggle workspace_diagnostics<CR>",
	{ desc = "Code Diagnostics (Workspace)", silent = true }
)
map("n", "<leader>cr", ":lua vim.lsp.buf.rename()<CR>", { desc = "Rename", silent = true })
map(
	"n",
	"<leader>ca",
	":lua vim.lsp.buf.code_action()<CR>",
	{ desc = "Code Actions", silent = true }
)

-- buffers
map("n", "<leader>bd", ":bd<cr>", { desc = "Close Buffer", silent = true })
map(
	"n",
	"<leader>bw",
	":bw<cr>",
	{ desc = "Close Buffer without Saving (careful with this one!)", silent = true }
)
map("n", "<leader>bs", ":Telescope buffers<cr>", { desc = "Switch Buffers", silent = true })

-- search
map("n", "<leader>sg", ":Telescope live_grep<cr>", { desc = "Live Grep", silent = true })

-- UI
map("n", "<leader>un", "", {
	desc = "Notification History",
	silent = true,
	callback = function()
		require("telescope").extensions.notify.notify({ layout_strategy = "vertical" })
	end,
})
