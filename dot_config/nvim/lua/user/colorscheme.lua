local colorscheme = "tokyonight"

-- tokyonight
if colorscheme == "tokyonight" then
  vim.g.tokyonight_style = "storm"
  vim.g.tokyonight_italic_functions = true
  -- vim.g.tokyonight_transparent = true
  vim.g.tokyonight_colors = { comment = "#777777" }
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

