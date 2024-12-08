vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.autoindent = true
vim.opt.autowrite = true
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.formatoptions:remove("o")
vim.opt.grepprg = "rg --vimgrep"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.winminwidth = 5
