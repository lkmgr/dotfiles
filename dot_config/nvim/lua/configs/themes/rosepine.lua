local status_ok, rosepine = pcall(require, "rose-pine")
if not status_ok then
  return
end

rosepine.setup {
  dark_variant = "moon",
  bold_vert_split = true,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = true,
  disable_italics = false,
}

vim.cmd "colorscheme rose-pine"
