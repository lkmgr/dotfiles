local M = {}

function M.add_cmp_source(source, priority)
  local cmp_avail, cmp = pcall(require, "cmp")
  if cmp_avail then
    local config = cmp.get_config()
    table.insert(config.sources, { name = source, priority = priority })
    cmp.setup(config)
  end
end

return M

