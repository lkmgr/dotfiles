return {
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",
  "tpope/vim-repeat",
  "b0o/schemastore.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-lua/plenary.nvim",

  {
    "stevearc/dressing.nvim",
    config = true,
  },

  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
    -- opts = {
    --   pre_hook = function()
    --     return vim.bo.commentstring
    --   end,
    -- },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.setup({
        window = {
          border = "single",
        },
      })

      wk.register({
        ["g"] = { name = "+goto" },
        ["z"] = { name = "+fold" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      })

      -- wk.register({
      --   c = { name = "[C]ode", _ = "which_key_ignore" },
      --   d = { name = "[D]ocument", _ = "which_key_ignore" },
      --   r = { name = "[R]ename", _ = "which_key_ignore" },
      --   s = { name = "[S]earch", _ = "which_key_ignore" },
      --   w = { name = "[W]orkspace", _ = "which_key_ignore" },
      -- }, {
      --   prefix = "<leader>",
      -- })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        markdown = { "prettierd" },
        yaml = { "prettierd" },
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    opts = { signs = false },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc" },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
    },
    main = "ibl",
  },

  {
    "ggandor/leap.nvim",
    config = function()
      local leap = require("leap")
      -- leap.create_default_mappings()
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
      leap.opts.special_keys.prev_target = "<bs>"
      leap.opts.special_keys.prev_group = "<bs>"
      require("leap.user").set_repeat_keys("<cr>", "<bs>")
    end,
  },

  {
    "ggandor/flit.nvim",
    config = true,
  },

  {
    "folke/trouble.nvim",
    config = true,
  },

  {
    "nvim-pack/nvim-spectre",
    config = true,
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = true,
  },

  {
    "b0o/incline.nvim",
    config = function()
      local helpers = require("incline.helpers")
      local devicons = require("nvim-web-devicons")

      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            " ",
            guibg = props.focused and "#44406e" or "transparent",
          }
        end,
      })
    end,
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
          providers = { "lsp" },
        },
      })
    end,
  },
}
