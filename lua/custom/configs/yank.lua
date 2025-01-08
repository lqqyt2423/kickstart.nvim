local utils = require 'custom.utils'

local function absolute_path()
  return vim.fn.expand '%:p'
end

local function yank(str)
  vim.fn.setreg('+', str)
  vim.notify('Yank: ' .. str)
end

local function yank_path()
  local path = absolute_path()
  yank(path)
end

vim.api.nvim_create_user_command('YankPath', function()
  yank_path()
end, { desc = '[Y]ank [P]ath' })

vim.keymap.set('n', '<leader>yp', function()
  yank_path()
end, { desc = '[Y]ank [P]ath' })

local function yank_dir()
  local path = absolute_path()
  local dir = utils.path_dir(path)
  yank(dir)
end

vim.api.nvim_create_user_command('YankDir', function()
  yank_dir()
end, { desc = '[Y]ank [D]ir' })

vim.keymap.set('n', '<leader>yd', function()
  yank_dir()
end, { desc = '[Y]ank [D]ir' })

local function yank_filename()
  local path = absolute_path()
  local filename = utils.path_basename(path)
  yank(filename)
end

vim.api.nvim_create_user_command('YankFilename', function()
  yank_filename()
end, { desc = '[Y]ank [F]ilename' })

vim.keymap.set('n', '<leader>yf', function()
  yank_filename()
end, { desc = '[Y]ank [F]ilename' })
