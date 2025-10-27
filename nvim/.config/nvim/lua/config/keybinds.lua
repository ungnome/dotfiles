local map = vim.keymap.set
local lsp = vim.lsp
local picker = require("snacks").picker

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
map({ "n", "i", "s" }, "<C-s>", vim.lsp.buf.signature_help, { desc = "Show Signature help" })

-- find
map("n", "<leader>ff", function() picker.files({ hidden = true }) end, { desc = "Files (cwd)", silent = true })
map("n", "<leader>fg", function() picker.git_files() end, { desc = "Files (git)", silent = true })
map("n", "<leader>fb", function() picker.buffers() end, { desc = "Buffers", silent = true })

-- search
map("n", "<leader>sg", function() picker.grep() end, { desc = "Grep", silent = true })
map("n", "<leader>sh", function() picker.help() end, { desc = "Help", silent = true })
map("n", "<leader>sk", function() picker.keymaps() end, { desc = "Keybinds", silent = true })
map("n", "<leader>ss", function() picker.lsp_symbols() end, { desc = "Buffer Symbols", silent = true })
map("n", "<leader>sS", function() picker.lsp_workspace_symbols() end, { desc = "Workspace Symbols", silent = true })

-- diagnostics
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostics" })

-- UI
map("n", "<leader>uc", ":NoNeckPain<cr>", { desc = "Toggle Center Buffer", silent = true })
map("n", "<leader>ul", ":ToggleListCharacters<cr>", { desc = "Toggle list Characters", silent = true })
