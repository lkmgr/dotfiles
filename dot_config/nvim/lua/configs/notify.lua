local M = {}

function M.config()
  local status_ok, notify = pcall(require, "notify")
  if not status_ok then
    return
  end

  notify.setup {
    -- Minimum level to show
    level = "info",

    -- Animation style (see below for details)
    stages = "fade_in_slide_out",

    -- Function called when a new window is opened, use for changing win settings/config
    on_open = nil,

    -- Function called when a window is closed
    on_close = nil,

    -- Render function for notifications. See notify-render()
    render = "default",

    -- Default timeout for notifications
    timeout = 5000,

    -- Max number of columns for messages
    max_width = nil,
    -- Max number of lines for a message
    max_height = nil,

    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
    background_colour = "#000000CC",

    -- Minimum width for notification windows
    minimum_width = 35,

    -- Icons for the different levels
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  }

  require("telescope").load_extension "notify"

  vim.notify = notify
end

return M
