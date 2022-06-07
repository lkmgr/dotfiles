local M = {}

function M.config()
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    return
  end

  local colors = require("catppuccin.api.colors").get_colors()

  catppuccin.setup {
    transparent_background = false,
    term_colors = false,
    styles = {
      comments = "italic",
      conditionals = "italic",
      loops = "italic",
      functions = "italic",
      keywords = "italic",
      strings = "NONE",
      variables = "NONE",
      numbers = "NONE",
      booleans = "italic",
      properties = "NONE",
      types = "NONE",
      operators = "NONE",
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = "NONE",
          hints = "NONE",
          warnings = "NONE",
          information = "NONE",
        },
        underlines = {
          errors = "underline",
          hints = "underline",
          warnings = "underline",
          information = "underline",
        },
      },
      lsp_trouble = true,
      cmp = true,
      lsp_saga = false,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = false,
        show_root = false,
        transparent_panel = false,
      },
      neotree = {
        enabled = true,
        show_root = true,
        transparent_panel = true,
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
      },
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = true,
      ts_rainbow = true,
      hop = false,
      notify = true,
      telekasten = true,
      symbols_outline = true,
    },
  }

  catppuccin.remap {
    CursorColumn = { bg = "#3B3F52" },
    DevIconGraphQL = { fg = "#c956ff" },
    IndentBlanklineContextChar = { fg = colors.mauve },
    IndentBlanklineContextStart = { sp = colors.mauve, style = "underline" },
    LightspeedPendingChangeOpArea = { style = "NONE" },
    LightspeedPendingOpArea = { style = "NONE" },
    LightspeedUniqueChar = { style = "NONE" },
  }

  vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
  vim.api.nvim_command "colorscheme catppuccin"
end

return M
