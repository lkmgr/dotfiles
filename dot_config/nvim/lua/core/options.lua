local options = {
  backup = false, -- Disable making a backup file
  breakindent = true, -- Enable break indent
  clipboard = "unnamedplus", -- Connection to the system clipboard
  cmdheight = 1, -- Number of screen lines to use for the command line
  colorcolumn = "99999", -- Fix for the indentline problem
  completeopt = { "menuone", "noselect" }, -- Options for insert mode completion
  conceallevel = 0, -- Show text normally
  cursorline = true, -- Highlight the text line of the cursor
  expandtab = true, -- Enable the use of space in tab
  fileencoding = "utf-8", -- File content encoding for the buffer
  fillchars = { eob = " " }, -- Disable `~` on nonexistent lines
  foldmethod = "manual", -- Create folds manually
  hidden = true, -- Ignore unsaved buffers
  history = 100, -- Number of commands to remember in a history table
  hlsearch = true, -- Highlight all the matches of search pattern
  ignorecase = true, -- Case insensitive searching
  mouse = "a", -- Enable mouse support
  number = true, -- Show numberline
  pumheight = 10, -- Height of the pop up menu
  relativenumber = true, -- Show relative numberline
  scrolloff = 8, -- Number of lines to keep above and below the cursor
  shiftwidth = 2, -- Number of space inserted for indentation
  showmode = false, -- Disable showing modes in command line
  sidescrolloff = 8, -- Number of columns to keep at the sides of the cursor
  signcolumn = "yes", -- Always show the sign column
  smartcase = true, -- Case sensitivie searching
  smartindent = true, -- Do auto indenting when starting a new line
  spell = false, -- Disable spelling checking and highlighting
  spelllang = "en", -- Support US english
  splitbelow = true, -- Splitting a new window below the current one
  splitright = true, -- Splitting a new window at the right of the current one
  swapfile = false, -- Disable use of swapfile for the buffer
  tabstop = 2, -- Number of space in a tab
  termguicolors = true, -- Enable 24-bit RGB color in the TUI
  timeoutlen = 250, -- Length of time to wait for a mapped sequence
  title = true,
  undofile = true, -- Enable persistent undo
  updatetime = 300, -- Length of time to wait before triggering the plugin
  wrap = false, -- Disable wrapping of lines longer than the width of window
  writebackup = false, -- Disable making a backup before overwriting a file
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.do_filetype_lua = 1 -- use filetype.lua
vim.g.did_load_filetypes = 0 -- don't use filetype.vim

-- vim.api.nvim_command(("colorscheme %s"):format('onedark'))
