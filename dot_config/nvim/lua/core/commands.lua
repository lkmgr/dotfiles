local utils = require "core.utils"

local cmd = vim.api.nvim_create_user_command

cmd("OpenURIUnderCursor", utils.open_uri_under_cursor, {})
cmd("ReloadConfig", ":source $MYVIMRC", {})
cmd("ToggleTheme", utils.toggle_theme, {})
cmd("PackerSnapAndSync", utils.packer_snap_and_sync, {})
cmd("ResizeMode", require("smart-splits").start_resize_mode, {})
