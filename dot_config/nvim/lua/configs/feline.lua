local M = {}

function M.config()
  local status_ok, feline = pcall(require, "feline")
  if not status_ok then
    return
  end

  local provider = require("core.status").provider
  local conditional = require("core.status").conditional
  local mode = require("core.status").mode
  local icons = require("core.status").icons

  local colors = require("onedarkpro").get_colors(vim.g.onedarkpro_style)
  -- local color_utils = require("onedarkpro.utils")

  feline.setup {
    components = {
      active = {
        {
          { provider = icons.vim, hl = mode.hl() },
          { provider = mode.text(), hl = mode.hl() },
          { provider = provider.spacer(1), hl = mode.hl(), right_sep = icons.right },
          { provider = provider.spacer(1) },
          { provider = "git_branch", hl = { fg = colors.green, style = "bold" }, icon = " " },
          { provider = provider.spacer(1), enabled = conditional.git_available },
          { provider = " ", hl = { fg = colors.fg }, enabled = conditional.git_available },
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
          { provider = "", hl = { fg = colors.fg }, enabled = conditional.git_changed },
          { provider = "git_diff_added", hl = { fg = colors.green }, icon = "  " },
          { provider = "git_diff_changed", hl = { fg = colors.yellow }, icon = " 柳" },
          { provider = "git_diff_removed", hl = { fg = colors.red }, icon = "  " },
          { provider = provider.spacer(2), enabled = conditional.git_changed },
          { provider = " ", hl = { fg = colors.fg } },
          { provider = "diagnostic_errors", hl = { fg = colors.red }, icon = "  " },
          { provider = "diagnostic_warnings", hl = { fg = colors.yellow }, icon = "  " },
          { provider = "diagnostic_info", hl = { fg = colors.gray }, icon = "  " },
          { provider = "diagnostic_hints", hl = { fg = colors.blue }, icon = "  " },
        },
        {
          {
            provider = { name = "file_type", opts = { filetype_icon = true, case = "lowercase" } },
            enabled = conditional.has_filetype,
          },
          { provider = " ", hl = { fg = colors.fg } },
          {
            provider = provider.lsp_client_names(true),
            -- short_provider = provider.lsp_client_names(),
            icon = icons.lsp,
            truncate_hide = true,
            hl = { fg = colors.purple },
          },
          { provider = " ", hl = { fg = colors.fg } },
          { provider = provider.spacer(1) },
          { provider = provider.treesitter_status, hl = { fg = colors.green } },
          { provider = provider.spacer(1) },
          { provider = "", hl = { fg = colors.fg } },
          {
            provider = { name = "position" },
            icon = icons.position,
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
            provider = { name = "file_info", opts = { type = "relative" } },
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
