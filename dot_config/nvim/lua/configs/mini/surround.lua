local M = {}

function M.config()
  local surround_ok, surround = pcall(require, "mini.surround")
  if not surround_ok then
    return
  end

  surround.setup {
    custom_surroundings = {
      ["("] = { output = { left = "( ", right = " )" } },
      ["["] = { output = { left = "[ ", right = " ]" } },
      ["{"] = { output = { left = "{ ", right = " }" } },
      ["<"] = { output = { left = "< ", right = " >" } },
    },
    mappings = {
      add = "ys",
      delete = "ds",
      find = "",
      find_left = "",
      highlight = "",
      replace = "cs",
      update_n_lines = "",
    },
  }
end

return M
