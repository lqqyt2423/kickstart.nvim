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

vim.keymap.set('n', 'gm', function()
  local pos = vim.fn.getcursorcharpos()
  local line = vim.fn.getline '.'

  if string.len(line) == 0 then
    return
  end

  local first_c_index = 0

  for i = 1, #line do
    local c = line:sub(i, i)

    if first_c_index == 0 and c ~= ' ' and c ~= '\t' then
      first_c_index = i
      break
    end
  end

  local middle = math.floor((first_c_index + string.len(line)) / 2)
  vim.fn.setcursorcharpos { pos[2], middle }
end, { desc = 'Go to line middle' })
