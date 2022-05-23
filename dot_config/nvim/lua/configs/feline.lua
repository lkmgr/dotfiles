local M = {}

function M.config()
  local status_ok, feline = pcall(require, "feline")
  if not status_ok then
    return
  end

  local hl = require("core.status").hl
  local provider = require("core.status").provider
  local conditional = require("core.status").conditional
  local mode = require("core.status").mode

  local colors = require("onedarkpro").get_colors(vim.g.onedarkpro_style)
  -- local color_utils = require("onedarkpro.utils")

  local theme = {
    bg = colors.bg,
    fg = colors.fg,
    red = colors.red,
    orange = colors.orange,
    yellow = colors.yellow,
    green = colors.green,
    cyan = colors.cyan,
    blue = colors.blue,
    purple = colors.purple,
    white = colors.white,
    black = colors.black,
    gray = colors.gray,
    highlight = colors.highlight,
    bg_statusline = colors.bg_statusline,
    fg_gutter = colors.fg_gutter,
    fg_sidebar = colors.fg_sidebar,
  }

  local icons = {
    left = "",
    right = "",
    -- right = "",
    vim_icon = " ",
    vi_mode_icon = " ",
    position_icon = " ",
  }

  feline.setup {
    components = {
      active = {
        {
          { provider = " " .. icons.vim_icon, hl = mode.hl() },
          { provider = mode.text(), hl = mode.hl() },
          { provider = provider.spacer(1), hl = mode.hl(), right_sep = icons.right },
          { provider = provider.spacer(1) },
          { provider = "git_branch", hl = { fg = colors.green, style = "bold" }, icon = " " },
          { provider = provider.spacer(2), enabled = conditional.git_available },
          {
            provider = {
              name = "file_info",
              opts = { type = "relative", file_modified_icon = "" },
            },
            short_provider = {
              name = "file_info",
              opts = { type = "relative-short", file_modified_icon = "" },
            },
          },
          { provider = provider.spacer(1) },
          { provider = "git_diff_added", hl = { fg = colors.orange }, icon = "  " },
          { provider = "git_diff_changed", hl = { fg = colors.yellow }, icon = " 柳" },
          { provider = "git_diff_removed", hl = { fg = colors.green }, icon = "  " },
          { provider = provider.spacer(2), enabled = conditional.git_changed },
          { provider = "diagnostic_errors", hl = { fg = colors.cyan }, icon = "  " },
          { provider = "diagnostic_warnings", hl = { fg = colors.blue }, icon = "  " },
          { provider = "diagnostic_info", hl = { fg = colors.gray }, icon = "  " },
          { provider = "diagnostic_hints", hl = { fg = colors.yellow }, icon = "  " },
        },
        {
          {
            provider = provider.lsp_client_names(true),
            -- short_provider = provider.lsp_client_names(),
            icon = "   ",
            truncate_hide = true,
            hl = { fg = colors.purple },
          },
          { provider = provider.spacer(1) },
          { provider = provider.treesitter_status, hl = { fg = colors.green } },
          { provider = provider.spacer(1) },
          {
            provider = {
              name = "position",
              opts = { padding = true },
            },
          },
          { provider = provider.spacer(1) },
          { provider = "line_percentage", hl = mode.hl(), left_sep = icons.left },
          { provider = provider.spacer(1), hl = mode.hl() },
        },
      },
      inactive = {
        {
          { provider = provider.spacer(1) },
          {
            provider = {
              name = "file_info",
              opts = { type = "relative" },
            },
          },
        },
      },
    },
    theme = {
      bg = colors.bg_statusline,
      fg = colors.fg,
    },
    force_inactive = {
      filetypes = {
        "^packer$",
        "^startify$",
        "^fugitive$",
        "^fugitiveblame$",
        "^qf$",
        "^help$",
      },
      buftypes = {
        "^terminal$",
      },
      bufnames = {},
    },
    disable = {
      filetypes = {
        "^NvimTree$",
        "^neo%-tree$",
      },
    },
  }
end

return M
