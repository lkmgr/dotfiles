vim.o.formatoptions = "jcrql"

vim.opt.shortmess:append { I = true }

-- vim.opt.showtabline = 2 -- always display tabline
vim.opt.autowrite = true
vim.opt.backspace = vim.opt.backspace + { "nostop" } -- Don't stop backspace at insert
vim.opt.clipboard = "unnamedplus" -- Connection to the system clipboard
vim.opt.cmdheight = 1
vim.opt.conceallevel = 1
vim.opt.confirm = true
vim.opt.copyindent = true -- Copy the previous indentation on autoindenting
vim.opt.expandtab = true -- Enable the use of space in tab
vim.opt.fileencoding = "utf-8" -- File content encoding for the buffer
vim.opt.history = 100 -- Number of commands to remember in a history table
vim.opt.laststatus = 3 -- globalstatus
vim.opt.lazyredraw = true -- lazily redraw screen
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "•", nbsp = "␣", precedes = "⟨", extends = "⟩" }
vim.opt.preserveindent = true -- Preserve indent structure as much as possible
vim.opt.pumheight = 10
vim.opt.relativenumber = true -- Show relative numberline
vim.opt.scrolloff = 8 -- Number of lines to keep above and below the cursor
vim.opt.shiftround = true
vim.opt.shiftwidth = 2 -- Number of space inserted for indentation
vim.opt.sidescrolloff = 8 -- Number of columns to keep at the sides of the cursor
vim.opt.tabstop = 2 -- Number of space in a tab
vim.opt.timeoutlen = 300 -- Length of time to wait for a mapped sequence
vim.opt.updatetime = 300 -- Length of time to wait before triggering the plugin

vim.g.mapleader = " " -- set leader key
vim.g.maplocalleader = " " -- set local leader key
