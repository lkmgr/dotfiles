local M = {}

function M.config()
  local bufremove_ok, bufremove = pcall(require, "mini.bufremove")
  if not bufremove_ok then
    return
  end

  bufremove.setup()
end

return M
