vim.keymap.set('n', 'L', function()
  local init_line = vim.fn.line '.'
  vim.cmd [[normal! L]]
  local after_line = vim.fn.line '.'
  if init_line == after_line then
    vim.api.nvim_command 'exe "normal! \\<C-d>"'
  end
end, { desc = 'Scroll down' })

vim.keymap.set('n', 'H', function()
  local init_line = vim.fn.line '.'
  vim.cmd [[normal! H]]
  local after_line = vim.fn.line '.'
  if init_line == after_line then
    vim.api.nvim_command 'exe "normal! \\<C-u>"'
  end
end, { desc = 'Scroll up' })
