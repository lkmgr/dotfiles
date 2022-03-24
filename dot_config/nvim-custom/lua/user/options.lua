local o = vim.opt

o.backup = false                          -- creates a backup file
o.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
o.cmdheight = 2                           -- more space in the neovim command line for displaying messages
o.completeopt = { "menuone", "noselect" } -- mostly just for cmp
o.conceallevel = 0                        -- so that `` is visible in markdown files
o.cursorline = true                       -- highlight the current line
o.expandtab = true                        -- convert tabs to spaces
o.fileencoding = "utf-8"                  -- the encoding written to a file
o.guifont = "monospace:h17"               -- the font used in graphical neovim applications
o.hlsearch = true                         -- highlight all matches on previous search pattern
o.ignorecase = true                       -- ignore case in search patterns
o.iskeyword:append "-"
o.mouse = "a"                             -- allow the mouse to be used in neovim
o.number = true                           -- set numbered lines
o.numberwidth = 4                         -- set number column width to 2 {default 4}
o.pumheight = 10                          -- pop up menu height
o.relativenumber = false                  -- set relative numbered lines
o.scrolloff = 8                           -- is one of my fav
o.shiftwidth = 2                          -- the number of spaces inserted for each indentation
o.shortmess:append "c"
o.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 2                         -- always show tabs
o.sidescrolloff = 8
o.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
o.smartcase = true                        -- smart case
o.smartindent = true                      -- make indenting smarter again
o.splitbelow = true                       -- force all horizontal splits to go below current window
o.splitright = true                       -- force all vertical splits to go to the right of current window
o.swapfile = false                        -- creates a swapfile
o.tabstop = 2                             -- insert 2 spaces for a tab
o.termguicolors = true                    -- set term gui colors (most terminals support this)
o.timeoutlen = 500                        -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true                         -- enable persistent undo
o.updatetime = 300                        -- faster completion (4000ms default)
o.wrap = false                            -- display lines as one long line
o.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=c formatoptions-=r formatoptions-=o]] -- TODO: this doesn't seem to work

