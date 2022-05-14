local M = {}

-- term_details can be either a string for just a command or
-- a complete table to provide full access to configuration when calling Terminal:new()
M.user_terminals = {}
function M.toggle_term_cmd(term_details)
  if type(term_details) == "string" then
    term_details = { cmd = term_details, hidden = true }
  end
  local term_key = term_details.cmd
  if vim.v.count > 0 and term_details.count == nil then
    term_details.count = vim.v.count
    term_key = term_key .. vim.v.count
  end
  if M.user_terminals[term_key] == nil then
    M.user_terminals[term_key] = require("toggleterm.terminal").Terminal:new(term_details)
  end
  M.user_terminals[term_key]:toggle()
end

function M.toggle_theme()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end

-- function M.set_theme_by_hour(start_hour, end_hour)
--   local time = tonumber(vim.fn.strftime "%H")
--   if time < start_hour or time > end_hour then
--     vim.o.background = "dark"
--   else
--     vim.o.background = "light"
--   end
--   -- vim.cmd [[doautoall ColorScheme]]
-- end

function M.open_uri_under_cursor()
  local function open_uri(uri)
    if type(uri) ~= "nil" then
      uri = string.gsub(uri, "#", "\\#") --double escapes any # signs
      uri = '"' .. uri .. '"'
      vim.cmd("!xdg-open " .. uri .. " > /dev/null")
      vim.cmd "mode"
      -- print(uri)
      return true
    else
      return false
    end
  end

  local word_under_cursor = vim.fn.expand "<cWORD>"

  -- any uri with a protocol segment
  local regex_protocol_uri = "%a*:%/%/[%a%d%#%[%]%-%%+:;!$@/?&=_.,~*()]*"
  if open_uri(string.match(word_under_cursor, regex_protocol_uri)) then
    return
  end

  -- consider anything that looks like string/string a github link
  local regex_plugin_url = "[%a%d%-%.%_]*%/[%a%d%-%.%_]*"
  if open_uri("https://github.com/" .. string.match(word_under_cursor, regex_plugin_url)) then
    return
  end
end

return M
