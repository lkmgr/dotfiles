local M = {}

function M.config()
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    return
  end

  local colors = require("catppuccin.palettes").get_palette()

  catppuccin.setup {
    dim_inactive = {
      enabled = true,
      shade = "dark",
      percentage = 0.05,
    },
    transparent_background = false,
    term_colors = false,
    compile = {
      enabled = false,
      path = vim.fn.stdpath "cache" .. "/catppuccin",
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = { "italic" },
      functions = { "italic" },
      keywords = { "italic" },
      strings = {},
      variables = {},
      numbers = {},
      booleans = { "italic" },
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = {},
          hints = {},
          warnings = {},
          information = {},
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      coc_nvim = false,
      lsp_trouble = true,
      cmp = true,
      lsp_saga = false,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = false,
        show_root = true,
        transparent_panel = false,
      },
      neotree = {
        enabled = true,
        show_root = true,
        transparent_panel = true,
      },
      dap = {
        enabled = true,
        enable_ui = true,
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
      mini = true,
    },
    custom_highlights = {
      CursorColumn = { bg = "#3B3F52" },
      DevIconGraphQL = { fg = "#c956ff" },
      IndentBlanklineContextChar = { fg = colors.mauve },
      IndentBlanklineContextStart = { sp = colors.mauve, style = { "underline" } },
      LightspeedPendingChangeOpArea = { style = {} },
      LightspeedPendingOpArea = { style = {} },
      LightspeedUniqueChar = { style = {} },
    },
  }

  vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
  vim.api.nvim_command "colorscheme catppuccin"
end

return M
