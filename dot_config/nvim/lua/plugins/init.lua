return {
  "nvim-lua/plenary.nvim",
  "tpope/vim-sleuth",
  "b0o/SchemaStore.nvim",
  "tpope/vim-repeat",
  "MunifTanjim/nui.nvim",
  "stevearc/dressing.nvim",

  {
    "rcarriga/nvim-notify",
    config = function() vim.notify = require "notify" end,
  },

  {
    "kyazdani42/nvim-web-devicons",
    opts = { default = true },
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
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
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = true,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    opts = {
      char = "▏",
      context_char = "▏",
      show_current_context = true,
      show_current_context_start = true,
      use_treesitter = true,
    },
  },

  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  { "kylechui/nvim-surround", config = true },

  {
    "folke/which-key.nvim",
    opts = {
      key_labels = {
        ["<leader>"] = "SPC",
        ["<space>"] = "SPC",
      },
      window = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
      wk.register {
        mode = { "n", "v" },
        ["<leader>l"] = { name = "+LSP", w = { name = "Workspace Folders" } },
        ["<leader>s"] = { name = "+Search" },
        ["<leader>u"] = { name = "+Options" },
      }
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {
        check_ts = true,
        ts_config = {
          lua = { "string", "comment" },
          javascript = { "template_string" },
        },
      }

      require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup {
        filetypes = { "*" },
        user_default_options = {
          names = false,
          RRGGBBAA = true,
        },
      }
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "williamboman/mason.nvim" },
    opts = function()
      local nls = require "null-ls"
      return {
        sources = {
          nls.builtins.formatting.stylua,
        },
      }
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function() require("luasnip/loaders/from_vscode").lazy_load() end,
  },

  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.tabline").setup()
      require("mini.bufremove").setup()
      require("mini.cursorword").setup()
    end,
  },
}
