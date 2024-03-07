return {
  -- {
  --   "echasnovski/mini.align",
  --   event = "VeryLazy",
  --   config = true,
  -- },

  -- {
  --   "hrsh7ih/nvim-cmp",
  --   opts = function()
  --     vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  --     local cmp = require("cmp")
  --     local defaults = require("cmp.config.default")()
  --     return {
  --       completion = {
  --         completeopt = "menu,menuone,noinsert",
  --       },
  --       snippet = {
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<C-e>"] = cmp.mapping.abort(),
  --         ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --         ["<S-CR>"] = cmp.mapping.confirm({
  --           behavior = cmp.ConfirmBehavior.Replace,
  --           select = true,
  --         }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --         ["<C-CR>"] = function(fallback)
  --           cmp.abort()
  --           fallback()
  --         end,
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp" },
  --         { name = "luasnip" },
  --         { name = "path" },
  --       }, {
  --         { name = "buffer" },
  --       }),
  --       formatting = {
  --         format = function(_, item)
  --           local icons = require("lazyvim.config").icons.kinds
  --           if icons[item.kind] then
  --             item.kind = icons[item.kind] .. item.kind
  --           end
  --           return item
  --         end,
  --       },
  --       experimental = {
  --         ghost_text = {
  --           hl_group = "CmpGhostText",
  --         },
  --       },
  --       sorting = defaults.sorting,
  --     }
  --   end,
  -- },

  {
    "gbprod/yanky.nvim",
    opts = {
      highlight = { timer = 500 },
    },
    keys = {
      -- stylua: ignore
      { "<leader>p", function() require("telescope").extensions.yank_history.yank_history({ }) end, desc = "Open Yank History" },
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
      { "]p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      { "[p", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
      -- { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      -- { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      -- { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
      -- { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
      -- { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
      -- { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
      -- { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
      -- { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
      -- { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
      -- { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
    },
  },
}
