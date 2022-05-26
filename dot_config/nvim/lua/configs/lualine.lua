local M = {}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local colors = require("onedarkpro").get_colors(vim.g.onedarkpro_style)

  local theme = {
    normal = {
      a = { bg = colors.green, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.green },
      c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
    },

    insert = {
      a = { bg = colors.blue, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.blue },
    },

    command = {
      a = { bg = colors.purple, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.purple },
    },

    visual = {
      a = { bg = colors.yellow, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.yellow },
    },

    replace = {
      a = { bg = colors.red, fg = colors.bg },
      b = { bg = colors.fg_gutter, fg = colors.red },
    },

    inactive = {
      a = { bg = colors.bg_statusline, fg = colors.blue },
      b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
      c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
    },
  }

  lualine.setup {
    options = {
      -- theme = bubbles_theme,
      theme = theme,
      component_separators = "|",
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "NvimTree", "neo-tree", "dashboard", "Outline", "alpha" },
      always_divide_middle = true,
      globalstatus = false,
    },
    sections = {
      lualine_a = {
        {
          function()
            return " "
          end,
          separator = "",
          padding = { left = 1, right = 0 },
        },
        { "mode", padding = { left = 1, right = 2 } },
      },
      lualine_b = {
        { "filename", path = 1 },
        "branch",
      },
      lualine_c = { "diagnostics", "diff" },
      lualine_x = {},
      lualine_y = { "filetype", "progress" },
      lualine_z = {
        { "location", separator = "", left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
  }
end

return M
