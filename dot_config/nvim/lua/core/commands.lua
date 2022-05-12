local utils = require "core.utils"

vim.api.nvim_create_user_command("OpenURIUnderCursor", utils.open_uri_under_cursor, {})
vim.api.nvim_create_user_command("ReloadConfig", ":source $MYVIMRC", {})
vim.api.nvim_create_user_command("ToggleTheme", utils.toggle_theme, {})
