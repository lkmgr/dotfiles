-- local Util = require("lazy.core.util")

local M = {}

M.root_patterns = { ".git", "lua" }

function M.get_vim_tip() return vim.fn.system { "curl", "-s", "https://vtip.43z.one" } end

function M.fg(name)
  local hl = vim.api.nvim_get_hl(0, { name = name })
  local fg = hl and hl.fg or hl.foreground
  return fg and { fg = string.format("#%06x", fg) }
end

---@param silent boolean?
---@param values? {[1]:any, [2]:any}
function M.toggle(option, silent, values)
  if values then
    if vim.opt_local[option]:get() == values[1] then
      vim.opt_local[option] = values[2]
    else
      vim.opt_local[option] = values[1]
    end
    vim.notify("Set " .. option .. " to " .. vim.opt_local[option]:get(), vim.log.levels.INFO, { title = "Option" })
  end
  vim.opt_local[option] = not vim.opt_local[option]:get()
  if not silent then
    if vim.opt_local[option]:get() then
      vim.notify("Enabled " .. option, vim.log.levels.INFO, { title = "Option" })
    else
      vim.notify("Disabled " .. option, vim.log.levels.WARN, { title = "Option" })
    end
  end
end

local diag_enabled = true
function M.toggle_diagnostics()
  diag_enabled = not diag_enabled
  if diag_enabled then
    vim.diagnostic.enable()
    vim.notify("Enabled diagnostics", vim.log.levels.INFO, { title = "Diagnostics" })
  else
    vim.diagnostic.disable()
    vim.notify("Disabled diagnostics", vim.log.levels.WARN, { title = "Diagnostics" })
  end
end

-- delay notifications till vim.notify was replaced or after 500ms
function M.lazy_notify()
  local notifs = {}
  local function temp(...) table.insert(notifs, vim.F.pack_len(...)) end

  local orig = vim.notify
  vim.notify = temp

  local timer = vim.loop.new_timer()
  local check = vim.loop.new_check()

  local replay = function()
    timer:stop()
    check:stop()
    if vim.notify == temp then
      vim.notify = orig -- put back the original notify if needed
    end
    vim.schedule(function()
      ---@diagnostic disable-next-line: no-unknown
      for _, notif in ipairs(notifs) do
        vim.notify(vim.F.unpack_len(notif))
      end
    end)
  end

  -- wait till vim.notify has been replaced
  check:start(function()
    if vim.notify ~= temp then replay() end
  end)
  -- or if it took more than 500ms, then something went wrong
  timer:start(500, 0, replay)
end

return M
