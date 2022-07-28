local M = {}

function M.config()
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    return
  end

  local cp = require("catppuccin.palettes").get_palette()

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
      all = {
        CursorColumn = { bg = "#3B3F52" },
        DevIconGraphQL = { fg = "#c956ff" },
        IndentBlanklineContextChar = { fg = cp.mauve },
        IndentBlanklineContextStart = { sp = cp.mauve, style = { "underline" } },
        LightspeedPendingChangeOpArea = { style = {} },
        LightspeedPendingOpArea = { style = {} },
        LightspeedUniqueChar = { style = {} },

        TelescopePromptPrefix = { bg = cp.mantle },
        TelescopePromptNormal = { bg = cp.mantle },
        TelescopeResultsNormal = { bg = cp.surface0 },
        TelescopePreviewNormal = { bg = cp.mantle },
        TelescopePromptBorder = { bg = cp.mantle, fg = cp.mantle },
        TelescopeResultsBorder = { bg = cp.surface0, fg = cp.surface0 },
        TelescopePreviewBorder = { bg = cp.mantle, fg = cp.mantle },
        TelescopePromptTitle = { fg = cp.mantle },
        TelescopeResultsTitle = { fg = cp.mauve },
        TelescopePreviewTitle = { fg = cp.mantle },
      },
    },
  }

  -- local color_palette = {
  --   rosewater = "#F2D5CF",
  --   flamingo = "#EEBEBE",
  --   pink = "#F4B8E4",
  --   mauve = "#CA9EE6",
  --   red = "#E78284",
  --   maroon = "#EA999C",
  --   peach = "#EF9F76",
  --   yellow = "#E5C890",
  --   green = "#A6D189",
  --   teal = "#81C8BE",
  --   sky = "#99D1DB",
  --   sapphire = "#85C1DC",
  --   blue = "#8CAAEE",
  --   lavender = "#BABBF1",
  --
  --   text = "#c6d0f5",
  --   subtext1 = "#b5bfe2",
  --   subtext0 = "#a5adce",
  --   overlay2 = "#949cbb",
  --   overlay1 = "#838ba7",
  --   overlay0 = "#737994",
  --   surface2 = "#626880",
  --   surface1 = "#51576d",
  --   surface0 = "#414559",
  --
  --   base = "#303446",
  --   mantle = "#292C3C",
  --   crust = "#232634",
  -- }

  vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
  vim.api.nvim_command "colorscheme catppuccin"
end

return M
