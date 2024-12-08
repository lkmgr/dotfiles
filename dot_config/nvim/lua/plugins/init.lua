return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      }
      opts.preselect = cmp.PreselectMode.None
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = LazyVim.cmp.confirm({ select = false }),
        ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
        ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
        ["<tab>"] = function(fallback)
          return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
        end,
      })
      opts.experimental = {
        ghost_text = false,
      }
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
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "vertical",
        path_display = { "truncate" },
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
}
