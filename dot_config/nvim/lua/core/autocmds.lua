-- local utils = require "core.utils"

local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- augroup("packer_plugins", {})
-- cmd("BufWritePost", {
--   desc = "Auto Compile plugins.lua file",
--   group = "packer_plugins",
--   command = "source <afile> | PackerCompile",
--   pattern = "plugins.lua",
-- })

local yank_highlight = augroup("yank_highlight", {})
cmd("TextYankPost", {
  desc = "Highlight Yank",
  group = yank_highlight,
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 400 }
  end,
  pattern = "*",
})

-- local init_group = augroup("enter_group", {})
-- cmd("VimEnter", {
--   desc = "Set theme by time of day",
--   group = init_group,
--   callback = function()
--     utils.set_theme_by_hour(8, 18)
--   end,
--   pattern = "*",
-- })

-- Remove kitty padding inside nvim
local kitty_padding = augroup("kitty_padding", {})
cmd("VimEnter", {
  desc = "Remove kitty padding on enter",
  group = kitty_padding,
  command = ":silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=0",
  pattern = "*",
})
cmd("VimLeave", {
  desc = "Reset kitty padding on leave",
  group = kitty_padding,
  command = ":silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing padding=default",
  pattern = "*",
})

-- Custom local opts
local custom_local_opts = augroup("custom_local_opts", {})
cmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
  desc = "No auto comment leader",
  group = custom_local_opts,
  callback = function()
    vim.opt_local.formatoptions:remove { "c", "r", "o" }
  end,
  pattern = "*",
})

cmd("FileType", {
  desc = "QF nobuflisted",
  group = custom_local_opts,
  callback = function()
    vim.opt_local.buflisted = false
  end,
  pattern = "qf",
})

cmd("FileType", {
  desc = "Cursorcolumns",
  group = custom_local_opts,
  callback = function()
    vim.opt_local.cursorcolumn = true
  end,
  pattern = { "yaml", "yml" },
})
