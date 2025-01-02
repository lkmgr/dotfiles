return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = "auto_insert",
        },
      },
      keymap = {
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "ibhagwan/fzf-lua",
    opts = {
      winopts = {
        height = 0.9,
        width = 0.9,
        preview = {
          layout = "vertical",
        },
      },
      oldfiles = {
        include_current_session = true,
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 250,
        ignore_whitespace = true,
      },
      current_line_blame_formatter = "   <author>, <author_time:%R> • <summary>",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
    },
  },
  {
    "echasnovski/mini.splitjoin",
    opts = {},
  },
}
