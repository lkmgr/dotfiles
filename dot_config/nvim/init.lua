require "config.options"
require("config.keymaps").setup()
require "config.autocmds"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- delay notifications till vim.notify was replaced or after 500ms
require("util").lazy_notify()

require("lazy").setup("plugins", {
  defaults = {
    lazy = false,
    cond = not vim.g.vscode,
  },
  install = {
    colorscheme = { "catppuccin" },
  },
  ui = {
    border = "single",
  },
  -- checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
