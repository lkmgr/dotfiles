local async = require "plenary.async"

local M = {}

-- term_details can be either a string for just a command or
-- a complete table to provide full access to configuration when calling Terminal:new()
M.user_terminals = {}
function M.toggle_term_cmd(term_details)
  if type(term_details) == "string" then term_details = { cmd = term_details, hidden = true } end
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
      return true
    else
      return false
    end
  end

  local word_under_cursor = vim.fn.expand "<cWORD>"

  -- any uri with a protocol segment
  local regex_protocol_uri = "%a*:%/%/[%a%d%#%[%]%-%%+:;!$@/?&=_.,~*()]*"
  if open_uri(string.match(word_under_cursor, regex_protocol_uri)) then return end

  -- consider anything that looks like string/string a github link
  local regex_plugin_url = "[%a%d%-%.%_]*%/[%a%d%-%.%_]*"
  if open_uri("https://github.com/" .. string.match(word_under_cursor, regex_plugin_url)) then
    return
  end
end

function M.packer_snap_and_sync()
  vim.notify("Creating Packer Snapshot and Syncing...", "info", { title = "Packer" })
  local snap_shot_time = os.date "!%Y-%m-%dT%TZ"
  vim.cmd("PackerSnapshot " .. snap_shot_time .. ".json")
  vim.cmd "PackerSync"
end

function M.null_ls_providers(filetype)
  local registered = {}
  local sources_avail, sources = pcall(require, "null-ls.sources")
  if sources_avail then
    for _, source in ipairs(sources.get_available(filetype)) do
      for method in pairs(source.methods) do
        registered[method] = registered[method] or {}
        table.insert(registered[method], source.name)
      end
    end
  end
  return registered
end

function M.null_ls_sources(filetype, source)
  local methods_avail, methods = pcall(require, "null-ls.methods")
  return methods_avail and M.null_ls_providers(filetype)[methods.internal[source]] or {}
end

-- Auto-install credit: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/blob/3e9534a04e2850fa9bd107556c679b993a8b14e7/lua/mason-tool-installer/init.lua
local do_install = function(p, version)
  if version then
    vim.notify(
      string.format("[Mason] Auto-Updating %s to %s...", p.name, version),
      vim.log.levels.INFO
    )
  else
    vim.notify(string.format("[Mason] Installing %s...", p.name), vim.log.levels.INFO)
  end
  p:on(
    "install:success",
    function() vim.notify(string.format("[Mason] Successfully installed %s", p.name), vim.log.levels.INFO) end
  )
  p:on(
    "install:failed",
    function() vim.notify(string.format("[Mason] Failed installing %s", p.name), vim.log.levels.ERROR) end
  )
  p:install { version = version }
end

function M.update_mason_servers()
  local mr_ok, mr = pcall(require, "mason-registry")
  local conf_ok, ensure_installed = pcall(require, "configs.lsp.servers")
  if not mr_ok or not conf_ok then return end

  for _, name in ipairs(ensure_installed) do
    local p = mr.get_package(name)
    if p:is_installed() then
      p:check_new_version(function(ok, version)
        if ok then do_install(p, version.latest_version) end
      end)
    else
      do_install(p)
    end
  end
end

return M
