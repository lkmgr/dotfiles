local utils = require "core.utils"
local colors = require("onedarkpro").get_colors(vim.g.onedarkpro_style)

local M = { hl = {}, provider = {}, conditional = {}, mode = {} }

local function hl_by_name(name)
  return string.format("#%06x", vim.api.nvim_get_hl_by_name(name.group, true)[name.prop])
end

local function hl_prop(group, prop)
  local status_ok, color = pcall(hl_by_name, { group = group, prop = prop })
  return status_ok and color or nil
end

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

function M.hl.group(hlgroup, base)
  return vim.tbl_deep_extend(
    "force",
    base or {},
    { fg = hl_prop(hlgroup, "foreground"), bg = hl_prop(hlgroup, "background") }
  )
end

function M.hl.fg(hlgroup, base)
  return vim.tbl_deep_extend("force", base or {}, { fg = hl_prop(hlgroup, "foreground") })
end

function M.hl.mode(base)
  return function()
    return M.hl.group(
      "Feline" .. M.modes[vim.fn.mode()][2],
      vim.tbl_deep_extend("force", { fg = colors.bg, bg = M.modes[vim.fn.mode()][3] }, base or {})
    )
  end
  -- local lualine_avail, lualine = pcall(require, "lualine.themes." .. vim.g.colors_name)
  -- return function()
  --   return M.hl.group(
  --     "Feline" .. M.modes[vim.fn.mode()][2],
  --     vim.tbl_deep_extend(
  --       "force",
  --       lualine_avail and lualine[M.modes[vim.fn.mode()][2]:lower()].a
  --         or { fg = C.bg_1, bg = M.modes[vim.fn.mode()][3] },
  --       base or {}
  --     )
  --   )
  -- end
end

function M.provider.lsp_progress()
  local Lsp = vim.lsp.util.get_progress_messages()[1]
  return Lsp
      and string.format(
        " %%<%s %s %s (%s%%%%) ",
        ((Lsp.percentage or 0) >= 70 and { "", "", "" } or { "", "", "" })[math.floor(
          vim.loop.hrtime() / 12e7
        ) % 3 + 1],
        Lsp.title or "",
        Lsp.message or "",
        Lsp.percentage or 0
      )
    or ""
end

function M.provider.lsp_client_names(expand_null_ls)
  return function()
    local buf_client_names = {}
    for _, client in ipairs(vim.lsp.buf_get_clients(0)) do
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
  return (ts and next(ts)) and " 綠TS" or ""
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
