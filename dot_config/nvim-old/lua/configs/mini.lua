local configs = { "bufremove", "starter", "trailspace" }

for _, config in ipairs(configs) do
  local ok, loaded = pcall(require, "configs.mini." .. config)
end
