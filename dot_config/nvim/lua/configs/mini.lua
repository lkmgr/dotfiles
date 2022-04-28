local M = {}

function M.config()
  local surround_ok, surround = pcall(require, "mini.surround")

  if surround_ok then
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

  local pairs_ok, pairs = pcall(require, "mini.pairs")

  if pairs_ok then
    pairs.setup()
  end
end

return M
