vim.api.nvim_create_user_command('CopyPath', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end, { desc = 'CopyPath' })
