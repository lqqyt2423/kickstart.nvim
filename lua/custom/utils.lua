local M = {}
local path_separator = package.config:sub(1, 1)

---@param path string
---@return string
function M.path_remove_trailing(path)
  local p, _ = path:gsub(path_separator .. '$', '')
  return p
end

---@param paths string[]
---@return string
function M.path_join(paths)
  return table.concat(vim.tbl_map(M.path_remove_trailing, paths), path_separator)
end

---@param path string
---@return fun(): string
function M.path_split(path)
  return path:gmatch('[^' .. path_separator .. ']+' .. path_separator .. '?')
end

--- Get the basename of the given path.
---@param path string
---@return string
function M.path_basename(path)
  path = M.path_remove_trailing(path)
  local i = path:match('^.*()' .. path_separator)
  if not i then
    return path
  end
  return path:sub(i + 1, #path)
end

--- Get the dir of the given path.
---@param path string
---@return string
function M.path_dir(path)
  path = M.path_remove_trailing(path)
  local i = path:match('^.*()' .. path_separator)
  if not i then
    return path
  end
  return path:sub(1, i - 1)
end

return M
