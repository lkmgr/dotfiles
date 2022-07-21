local M = {}

function M.config()
  local configs = { "bufremove", "starter", "surround", "trailspace" }

  for _, config in ipairs(configs) do
    local ok, loaded = pcall(require, "configs.mini." .. config)
    if ok then
      loaded.config()
    end
  end
end

return M
