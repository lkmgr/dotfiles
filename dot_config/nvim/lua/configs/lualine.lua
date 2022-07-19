local M = {}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local utils = require "core.utils"
  local colors = require("catppuccin.palettes").get_palette()
  -- local colors = require("onedarkpro").get_colors(vim.g.onedarkpro_style)

  -- local theme = {
  --   normal = {
  --     a = { bg = colors.green, fg = colors.bg },
  --     b = { bg = colors.fg_gutter, fg = colors.fg_sidebar },
  --     c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
  --   },
  --
  --   insert = {
  --     a = { bg = colors.blue, fg = colors.bg },
  --   },
  --
  --   command = {
  --     a = { bg = colors.purple, fg = colors.bg },
  --   },
  --
  --   visual = {
  --     a = { bg = colors.yellow, fg = colors.bg },
  --   },
  --
  --   replace = {
  --     a = { bg = colors.red, fg = colors.bg },
  --   },
  --
  --   inactive = {
  --     a = { bg = colors.bg_statusline, fg = colors.blue },
  --     b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  --     c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
  --   },
  -- }

  lualine.setup {
    options = {
      -- theme = bubbles_theme,
      -- theme = theme,
      theme = "catppuccin",
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
        { "mode", padding = 1 },
      },
      lualine_b = {
        { "filename", path = 1, shorting_target = 70 },
      },
      lualine_c = { "branch", "diagnostics", "diff" },
      lualine_x = {
        {
          function()
            local buf_client_names = {}
            for _, client in pairs(vim.lsp.buf_get_clients(0)) do
              if client.name == "null-ls" then
                vim.list_extend(buf_client_names, utils.null_ls_sources(vim.bo.filetype, "FORMATTING"))
                vim.list_extend(buf_client_names, utils.null_ls_sources(vim.bo.filetype, "DIAGNOSTICS"))
              else
                table.insert(buf_client_names, client.name)
              end
            end
            return table.concat(buf_client_names, ", ")
          end,
          icon = "  LSP:",
          color = { fg = colors.mauve },
        },
      },
      lualine_y = { "filetype", "progress" },
      lualine_z = {
        { "location", separator = "", padding = 1 },
      },
    },
    inactive_sections = {
      lualine_a = { { "filename", path = 1 } },
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
