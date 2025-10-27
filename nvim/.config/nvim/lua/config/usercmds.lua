vim.api.nvim_create_user_command("ToggleListCharacters", function() vim.opt.list = not vim.opt.list._value end, {})
