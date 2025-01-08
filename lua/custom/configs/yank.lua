local function yank_path()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Yank: ' .. path)
end

vim.api.nvim_create_user_command('YankPath', function()
  yank_path()
end, { desc = '[Y]ank [P]ath' })

vim.keymap.set('n', '<leader>yp', function()
  yank_path()
end, { desc = '[Y]ank [P]ath' })
