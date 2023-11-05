local vim = vim
local api = vim.api


-- Highlight on yank ----------------------------------------------------------
api.nvim_create_autocmd('TextYankPost', {
  group = api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150 }
  end,
})

