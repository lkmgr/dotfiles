local M = {}

function M.config()
  local status_ok, onedarkpro = pcall(require, "onedarkpro")
  if not status_ok then
    return
  end

  onedarkpro.setup {
    theme = "onedark",
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
    }
  }

  onedarkpro.load()

  --vim.api.nvim_command("colorscheme catppuccin")
end

return M

