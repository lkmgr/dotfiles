local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then return end

nightfox.setup {
  options = {
    transparent = false, -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false, -- Non focused panes set to alternative background
    styles = { -- Style to be applied to different syntax groups
      comments = "italic", -- Value is any valid attr-list value `:help attr-list`
      conditionals = "italic",
      constants = "italic",
      functions = "italic",
      keywords = "italic",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = { -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = { -- List of various plugins and additional options
      cmp = true,
      -- dap_ui = true,
      diagnostic = true,
      fidget = true,
      gitsigns = true,
      glyph_palette = true,
      lightspeed = true,
      lsp_trouble = true,
      mini = true,
      native_lsp = {
        enable = true,
        background = true,
      },
      neotree = true,
      notify = true,
      telescope = true,
      treesitter = true,
      whichkey = true,
    },
  },
  -- groups = {
  --   all = {
  --     CursorColumn = { bg = "#3B3F52" },
  --     DevIconGraphQL = { fg = "#c956ff" },
  --     IndentBlanklineContextChar = { fg = colors.mauve },
  --     IndentBlanklineContextStart = { sp = colors.mauve, style = { "underline" } },
  --     LightspeedPendingChangeOpArea = { style = {} },
  --     LightspeedPendingOpArea = { style = {} },
  --     LightspeedUniqueChar = { style = {} },
  --   },
  -- },
}

vim.cmd "colorscheme nordfox"
