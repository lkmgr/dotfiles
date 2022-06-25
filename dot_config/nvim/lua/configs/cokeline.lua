local M = {}

function M.config()
  local status_ok, cokeline = pcall(require, "cokeline")
  if not status_ok then
    return
  end

  local mappings = require "cokeline/mappings"

  local colors = require("catppuccin.api.colors").get_colors()
  local transparent = "#00000000"

  local components = {
    space = {
      text = " ",
      truncation = { priority = 1 },
    },

    separator = {
      text = " ",
      bg = transparent,
      truncation = { priority = 1 },
    },

    devicon = {
      text = function(buffer)
        return (mappings.is_picking_focus() or mappings.is_picking_close()) and buffer.pick_letter .. " "
          or buffer.devicon.icon
      end,
      fg = function(buffer)
        return (mappings.is_picking_focus() and colors.peach)
          or (mappings.is_picking_close() and colors.red)
          or buffer.devicon.color
      end,
      style = function(_)
        return (mappings.is_picking_focus() or mappings.is_picking_close()) and "italic,bold" or nil
      end,
      truncation = { priority = 1 },
    },

    index = {
      text = function(buffer)
        return buffer.index .. ": "
      end,
      fg = colors.mauve,
      truncation = { priority = 1 },
    },

    unique_prefix = {
      text = function(buffer)
        return buffer.unique_prefix
      end,
      fg = colors.surface2,
      style = "italic",
      truncation = {
        priority = 3,
        direction = "left",
      },
    },

    filename = {
      text = function(buffer)
        return buffer.filename
      end,
      style = function(buffer)
        return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold,underline")
          or (buffer.is_focused and "bold")
          or (buffer.diagnostics.errors ~= 0 and "underline")
          or nil
      end,
      truncation = {
        priority = 2,
        direction = "left",
      },
    },

    diagnostics = {
      text = function(buffer)
        return (buffer.diagnostics.errors ~= 0 and "  ") or (buffer.diagnostics.warnings ~= 0 and "  ") or ""
      end,
      fg = function(buffer)
        return (buffer.diagnostics.errors ~= 0 and colors.red)
          or (buffer.diagnostics.warnings ~= 0 and colors.yellow)
          or nil
      end,
      truncation = { priority = 1 },
    },

    modified_indicator = {
      text = function(buffer)
        return buffer.is_modified and "●" or ""
      end,
      fg = colors.rosewater,
      truncation = { priority = 1 },
    },

    sep_left = {
      text = "",
      fg = colors.base,
      bg = transparent,
    },

    sep_right = {
      text = "",
      fg = colors.base,
      bg = transparent,
    },
  }

  cokeline.setup {
    show_if_buffers_are_at_least = 2,

    buffers = {
      -- filter_valid = function(buffer) return buffer.type ~= 'terminal' end,
      -- filter_visible = function(buffer) return buffer.type ~= 'terminal' end,
      new_buffers_position = "next",
    },

    rendering = {
      max_buffer_width = 30,
    },

    default_hl = {
      fg = function(buffer)
        return buffer.is_focused and colors.text or colors.surface2
      end,
      bg = colors.base,
    },

    sidebar = {
      filetype = "neo-tree",
      components = {
        { text = "" },
      },
    },

    components = {
      components.separator,
      components.sep_left,
      components.space,
      components.devicon,
      components.space,
      -- components.index,
      components.unique_prefix,
      components.filename,
      components.diagnostics,
      components.space,
      components.modified_indicator,
      components.sep_right,
    },
  }
end

return M
