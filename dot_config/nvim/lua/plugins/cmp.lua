return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function() require("luasnip/loaders/from_vscode").lazy_load() end,
    -- opts = {
    --   history = true,
    --   delete_check_events = "TextChanged",
    -- },
    -- keys = {
    --   {
    --     "<tab>",
    --     function()
    --       return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
    --     end,
    --     expr = true, silent = true, mode = "i",
    --   },
    --   { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
    --   { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    -- },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"

      local border_opts = {
        border = "single",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      }

      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      cmp.setup {
        preselect = cmp.PreselectMode.None,
        -- completion = {
        --   completeopt = "menu,menuone,noinsert",
        -- },
        formatting = {
          format = function(entry, item)
            -- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            -- vim_item.menu = menu[entry.source.name]
            -- return vim_item
            local icons = require "config.icons"

            local kinds = icons.kinds
            if kinds[item.kind] then item.kind = string.format("%s %s", kinds[item.kind], item.kind) end

            local menu = icons.cmp_menu
            if menu[entry.source.name] then item.menu = menu[entry.source.name] end

            return item
          end,
        },
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        window = {
          completion = cmp.config.window.bordered(border_opts),
          documentation = cmp.config.window.bordered(border_opts),
        },
        sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 100 },
          { name = "nvim_lua", priority = 80 },
          { name = "luasnip", priority = 60, keyword_length = 2 },
          { name = "buffer", priority = 40 },
          { name = "path", priority = 20 },
        },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            -- cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        mapping = {
          ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
          ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
          ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-y>"] = cmp.config.disable,
          ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
          ["<CR>"] = cmp.mapping.confirm { select = false },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            -- elseif has_words_before() then
            --   cmp.complete()
            else
              fallback()
            end
            -- if cmp.visible() then
            --   cmp.select_next_item()
            -- else
            --   fallback()
            -- end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
            -- if cmp.visible() then
            --   cmp.select_prev_item()
            -- else
            --   fallback()
            -- end
          end, { "i", "s" }),
        },

        -- mapping = cmp.mapping.preset.insert {
        --   ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        --   ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        --   -- ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        --   -- ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        --   ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        --   ["<C-f>"] = cmp.mapping.scroll_docs(4),
        --   ["<C-Space>"] = cmp.mapping.complete(),
        --   ["<C-e>"] = cmp.mapping.abort(),
        --   ["<CR>"] = cmp.mapping.confirm { select = false },
        --   ["<S-CR>"] = cmp.mapping.confirm {
        --     behavior = cmp.ConfirmBehavior.Replace,
        --     select = false,
        --   },
        -- },

        -- mapping = {
        --   ["<Up>"] = cmp.mapping.select_prev_item(),
        --   ["<Down>"] = cmp.mapping.select_next_item(),
        --   ["<C-p>"] = cmp.mapping.select_prev_item(),
        --   ["<C-n>"] = cmp.mapping.select_next_item(),
        --   ["<C-k>"] = cmp.mapping.select_prev_item(),
        --   ["<C-j>"] = cmp.mapping.select_next_item(),
        --   ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
        --   ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
        --   ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        --   ["<C-y>"] = cmp.config.disable,
        --   ["<C-e>"] = cmp.mapping {
        --     i = cmp.mapping.abort(),
        --     c = cmp.mapping.close(),
        --   },
        --   ["<CR>"] = cmp.mapping.confirm {
        --     behavior = cmp.ConfirmBehavior.Replace,
        --     select = false,
        --   },
        --   ["<Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --       cmp.select_next_item()
        --     elseif luasnip.expandable() then
        --       luasnip.expand()
        --     elseif luasnip.expand_or_jumpable() then
        --       luasnip.expand_or_jump()
        --     elseif has_words_before() then
        --       cmp.complete()
        --     else
        --       fallback()
        --     end
        --   end, { "i", "s" }),
        --   ["<S-Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --       cmp.select_prev_item()
        --     elseif luasnip.jumpable(-1) then
        --       luasnip.jump(-1)
        --     else
        --       fallback()
        --     end
        --   end, { "i", "s" }),
        -- },
      }

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
