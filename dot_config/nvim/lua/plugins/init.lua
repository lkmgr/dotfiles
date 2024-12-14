return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.completion.list = opts.completion.list or {}
      opts.completion.list.selection = "auto_insert"
      opts.keymap = vim.tbl_extend("keep", {
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
      }, opts.keymap)
    end,
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
    opts = function(_, opts)
      opts.winopts.height = 0.9
      opts.winopts.width = 0.9
      opts.winopts.preview.layout = "vertical"
    end,
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
}
