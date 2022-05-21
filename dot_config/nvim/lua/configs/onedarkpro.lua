local M = {}

function M.config()
  local status_ok, onedarkpro = pcall(require, "onedarkpro")
  if not status_ok then
    return
  end

  vim.o.background = "dark"

  onedarkpro.setup {
    -- theme = "onedark",
    styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "italic", -- Style that is applied to comments
      keywords = "italic", -- Style that is applied to keywords
      functions = "italic", -- Style that is applied to functions
      variables = "NONE", -- Style that is applied to variables
      virtual_text = "italic", -- Style that is applied to virtual text
    },
    options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = true, -- Use the themes opinionated underline styles?
      undercurl = true, -- Use the themes opinionated undercurl styles?
      cursorline = true, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = true, -- When the window is out of focus, change the normal background?
    },
    hlgroups = {
      CursorColumn = { bg = "${cursorline}" },
      LightspeedCursor = { link = "lCursor" },
      -- NeoTreeWinSeparator = { bg = "${bg}", fg = "${bg}" },
      NeoTreeWinSeparator = { bg = "${color_column}", fg = "${color_column}" },
      TreesitterContext = { bg = "#333842" },
    },
  }

  onedarkpro.load()

  -- TODO: Move to hlgroups
  -- OneDarkPro purple for context indentlines
  vim.cmd [[highlight IndentBlanklineContextChar guifg=#c678dd gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineContextStart guisp=#c678dd gui=underline]]

  -- Transparent bg for current line blame
  vim.cmd [[highlight GitSignsCurrentLineBlame ctermfg=12 guifg=#5c6370 guibg=#00000000]]
end

return M
