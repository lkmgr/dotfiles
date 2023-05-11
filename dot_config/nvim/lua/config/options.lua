local o, opt = vim.o, vim.opt

vim.g.mapleader = " " -- set leader key
vim.g.maplocalleader = " " -- set local leader key

vim.cmd "filetype plugin indent on"

o.formatoptions = "jcrql"

opt.shortmess:append { W = true, c = true, C = true, I = true }

-- opt.showtabline = 2 -- always display tabline
opt.autowrite = true
opt.backspace = opt.backspace + { "nostop" } -- Don't stop backspace at insert
opt.clipboard = "unnamedplus" -- Connection to the system clipboard
opt.cmdheight = 1
opt.conceallevel = 0
opt.confirm = true
opt.copyindent = true -- Copy the previous indentation on autoindenting
opt.expandtab = true -- Enable the use of space in tab
opt.fileencoding = "utf-8" -- File content encoding for the buffer
opt.grepprg = "rg --vimgrep"
opt.history = 100 -- Number of commands to remember in a history table
opt.laststatus = 3 -- globalstatus
opt.lazyredraw = true -- lazily redraw screen
opt.list = true
opt.listchars = { tab = "→ ", trail = "•", nbsp = "␣", precedes = "⟨", extends = "⟩" }
opt.preserveindent = true -- Preserve indent structure as much as possible
opt.pumheight = 10
opt.relativenumber = true -- Show relative numberline
opt.scrolloff = 8 -- Number of lines to keep above and below the cursor
opt.shiftround = true
opt.shiftwidth = 2 -- Number of space inserted for indentation
opt.sidescrolloff = 8 -- Number of columns to keep at the sides of the cursor
opt.tabstop = 2 -- Number of space in a tab
opt.timeoutlen = 300 -- Length of time to wait for a mapped sequence
opt.updatetime = 200 -- Length of time to wait before triggering the plugin
opt.splitkeep = "screen"

opt.fillchars = {
  eob = " ",
  vert = "│",
  horiz = "─",
  horizdown = "┬",
  horizup = "┴",
  verthoriz = "┼",
  vertleft = "┤",
  vertright = "├",
}
