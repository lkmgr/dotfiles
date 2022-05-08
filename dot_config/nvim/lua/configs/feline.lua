local M = {}

function M.config()
  local status_ok, feline = pcall(require, "feline")
  if not status_ok then
    return
  end

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
    right = " ",
    main_icon = "  ",
    vi_mode_icon = " ",
    position_icon = " ",
  }

  -- local custom_providers = {
  --   main_icon = function()
  --     return {
  --       provider = icons.main_icon,
  --     }
  --   end,
  -- }

  local elements = {}

  elements.main_icon = {
    provider = icons.main_icon,
    hl = {
      fg = theme.bg,
      bg = theme.green,
    },
    right_sep = {
      str = icons.right,
      hl = {
        fg = theme.green,
        bg = theme.bg,
      },
    },
  }

  local components = {
    active = { {}, {}, {} },
  }

  table.insert(components.active[1], elements.main_icon)

  feline.setup {
    components = components,
    -- custom_providers = custom_providers,
    theme = theme,
    force_inactive = {
      filetypes = {
        "^NvimTree$",
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
        "^neo%-tree$",
      },
    },
  }
end

return M
