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

return M
