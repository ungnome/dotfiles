local map = vim.keymap.set
local lsp = vim.lsp

-- better up/down to handle wrapped lines
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- package managers
map("n", "<leader>l", ":Lazy<cr>", { desc = "Lazy", silent = true })
map("n", "<leader>m", ":Mason<cr>", { desc = "Mason", silent = true })

-- code
map("n", "<F2>", function() lsp.buf.rename() end, { desc = "Rename Symbol", silent = true })
map("n", "<F3>", function() require("conform").format() end, { desc = "Format Buffer", silent = false })

-- find
map("n", "<leader>ff", ":Pick files<cr>", { desc = "Files (cwd)", silent = true })
map("n", "<leader>fg", ":Pick git_files<cr>", { desc = "Files (git)", silent = true })
map("n", "<leader>fb", ":Pick buffers<cr>", { desc = "Buffers", silent = true })

-- search
map("n", "<leader>sg", ":Pick grep_live<cr>", { desc = "Grep", silent = true })
map("n", "<leader>sh", ":Pick help<cr>", { desc = "Help", silent = true })
map("n", "<leader>ss", ':Pick lsp scope="document_symbol"<cr>', { desc = "Buffer Symbols", silent = true })
map("n", "<leader>sS", ':Pick lsp scope="workspace_symbol"<cr>', { desc = "Workspace Symbols", silent = true })

-- diagnostics
map("n", "<leader>xd", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
