return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup {
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.04,
      },
      no_italic = false,
      no_bold = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        fidget = true,
        gitsigns = true,
        leap = true,
        markdown = true,
        mason = true,
        mini = true,
        neotree = true,
        cmp = true,
        notify = true,
        semantic_tokens = true,
        treesitter_context = true,
        treesitter = true,
        telescope = true,
        lsp_trouble = true,
        illuminate = true,
        which_key = true,

        -- special modules
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        dap = {
          enabled = true,
          enable_ui = true,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        navic = {
          enabled = false,
          custom_bg = "NONE",
        },
      },
    }
    vim.cmd.colorscheme "catppuccin"
  end,
}
