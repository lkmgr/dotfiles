local M = {}

function M.config()
  local surround_ok, surround = pcall(require, "mini.surround")
  if surround_ok then
    surround.setup {
      custom_surroundings = {
        ["("] = { output = { left = "( ", right = " )" } },
        ["["] = { output = { left = "[ ", right = " ]" } },
        ["{"] = { output = { left = "{ ", right = " }" } },
        ["<"] = { output = { left = "< ", right = " >" } },
      },
      mappings = {
        add = "ys",
        delete = "ds",
        find = "",
        find_left = "",
        highlight = "",
        replace = "cs",
        update_n_lines = "",
      },
    }
  end

  local trailspace_ok, trailspace = pcall(require, "mini.trailspace")
  if trailspace_ok then
    trailspace.setup()
  end

  local sessions_ok, sessions = pcall(require, "mini.sessions")
  if sessions_ok then
    sessions.setup {
      -- Whether to read latest session if Neovim opened without file arguments
      autoread = false,

      -- Whether to write current session before quitting Neovim
      autowrite = true,

      -- Directory where global sessions are stored (use `''` to disable)
      directory = vim.fn.stdpath "data" .. "/sessions",

      -- File for local session (use `''` to disable)
      file = "Session.vim",

      -- Whether to force possibly harmful actions (meaning depends on function)
      force = { read = false, write = true, delete = false },

      -- Hook functions for actions. Default `nil` means 'do nothing'.
      hooks = {
        -- Before successful action
        pre = { read = nil, write = nil, delete = nil },
        -- After successful action
        post = { read = nil, write = nil, delete = nil },
      },

      -- Whether to print session path after action
      verbose = { read = false, write = true, delete = true },
    }
  end

  local starter_ok, starter = pcall(require, "mini.starter")
  if starter_ok then
    starter.setup {
      -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
      -- started with intent to show something else.
      autoopen = true,
      -- Whether to evaluate action of single active item
      evaluate_single = false,
      -- Items to be displayed. Should be an array with the following elements:
      -- - Item: table with <action>, <name>, and <section> keys.
      -- - Function: should return one of these three categories.
      -- - Array: elements of these three types (i.e. item, array, function).
      -- If `nil` (default), default items will be used (see |mini.starter|).
      items = nil,
      -- Header to be displayed before items. Converted to single string via
      -- `tostring` (use `\n` to display several lines). If function, it is
      -- evaluated first. If `nil` (default), polite greeting will be used.
      header = nil,
      -- Footer to be displayed after items. Converted to single string via
      -- `tostring` (use `\n` to display several lines). If function, it is
      -- evaluated first. If `nil` (default), default usage help will be shown.
      footer = nil,
      -- Array  of functions to be applied consecutively to initial content.
      -- Each function should take and return content for 'Starter' buffer (see
      -- |mini.starter| and |MiniStarter.content| for more details).
      content_hooks = nil,
      -- Characters to update query. Each character will have special buffer
      -- mapping overriding your global ones. Be careful to not add `:` as it
      -- allows you to go into command mode.
      query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
    }
  end

  local bufremove_ok, bufremove = pcall(require, "mini.bufremove")
  if bufremove_ok then
    bufremove.setup()
  end
end

return M
