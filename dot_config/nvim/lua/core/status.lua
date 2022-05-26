local utils = require "core.utils"
local colors = require("onedarkpro").get_colors(vim.g.onedarkpro_style)

local M = { provider = {}, conditional = {}, mode = {}, icons = {} }

M.icons = {
  left = "",
  right = "",
  -- right = "",
  vim = "  ",
  position = "  ",
  lsp = "   ",
  ts = " ",
}

M.modes = {
  ["n"] = { "NORMAL", "Normal", colors.blue },
  ["no"] = { "N-PENDING", "Normal", colors.blue },
  ["i"] = { "INSERT", "Insert", colors.green },
  ["ic"] = { "INSERT", "Insert", colors.green },
  ["t"] = { "TERMINAL", "Insert", colors.green },
  ["v"] = { "VISUAL", "Visual", colors.purple },
  ["V"] = { "V-LINE", "Visual", colors.purple },
  [""] = { "V-BLOCK", "Visual", colors.purple },
  ["R"] = { "REPLACE", "Replace", colors.red },
  ["Rv"] = { "V-REPLACE", "Replace", colors.red },
  ["s"] = { "SELECT", "Visual", colors.orange },
  ["S"] = { "S-LINE", "Visual", colors.orange },
  [""] = { "S-BLOCK", "Visual", colors.orange },
  ["c"] = { "COMMAND", "Command", colors.yellow },
  ["cv"] = { "COMMAND", "Command", colors.yellow },
  ["ce"] = { "COMMAND", "Command", colors.yellow },
  ["r"] = { "PROMPT", "Inactive", colors.gray },
  ["rm"] = { "MORE", "Inactive", colors.gray },
  ["r?"] = { "CONFIRM", "Inactive", colors.gray },
  ["!"] = { "SHELL", "Inactive", colors.gray },
}

function M.mode.text()
  return function()
    return M.modes[vim.fn.mode()][1]
  end
end

function M.mode.hl(fg)
  if not fg then
    fg = colors.bg
  end
  return function()
    return {
      name = "FelineMode" .. M.modes[vim.fn.mode()][2],
      fg = fg,
      bg = M.modes[vim.fn.mode()][3],
      style = "bold",
    }
  end
end

function M.provider.lsp_client_names(expand_null_ls)
  return function()
    local buf_client_names = {}
    for _, client in pairs(vim.lsp.buf_get_clients(0)) do
      if client.name == "null-ls" and expand_null_ls then
        vim.list_extend(buf_client_names, utils.null_ls_sources(vim.bo.filetype, "FORMATTING"))
        vim.list_extend(buf_client_names, utils.null_ls_sources(vim.bo.filetype, "DIAGNOSTICS"))
      else
        table.insert(buf_client_names, client.name)
      end
    end
    return table.concat(buf_client_names, ", ")
  end
end

function M.provider.treesitter_status()
  local ts = vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()]
  return (ts and next(ts)) and M.icons.ts .. "TS" or ""
end

function M.provider.spacer(n)
  return string.rep(" ", n or 1)
end

function M.conditional.git_available()
  return vim.b.gitsigns_head ~= nil
end

function M.conditional.git_changed()
  local git_status = vim.b.gitsigns_status_dict
  return git_status and (git_status.added or 0) + (git_status.removed or 0) + (git_status.changed or 0) > 0
end

function M.conditional.has_filetype()
  return vim.fn.empty(vim.fn.expand "%:t") ~= 1 and vim.bo.filetype and vim.bo.filetype ~= ""
end

function M.conditional.bar_width(n)
  return function()
    return (vim.opt.laststatus:get() == 3 and vim.opt.columns:get() or vim.fn.winwidth(0)) > (n or 80)
  end
end

return M
