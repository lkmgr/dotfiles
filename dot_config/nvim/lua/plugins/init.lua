return {
  "nvim-lua/plenary.nvim",
  "tpope/vim-sleuth",
  "b0o/SchemaStore.nvim",
  "tpope/vim-repeat",
  "MunifTanjim/nui.nvim",
  "stevearc/dressing.nvim",

  {
    "ggandor/leap.nvim",
    config = function() require("leap").add_default_mappings() end,
  },
  {
    "ggandor/flit.nvim",
    config = true,
  },

  "windwp/nvim-spectre",

  {
    "rcarriga/nvim-notify",
    config = function() vim.notify = require "notify" end,
  },

  {
    "kyazdani42/nvim-web-devicons",
    opts = { default = true },
  },

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup()
  --     vim.cmd [[colorscheme tokyonight]]
  --   end,
  -- },

  {
    "catppuccin/nvim",
    name = "catppuccin",
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
          percentage = 0.15,
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
          gitsigns = true,
          leap = true,
          markdown = true,
          mason = true,
          mini = true,
          neotree = true,
          cmp = true,
          notify = true,
          -- treesitter_context = true,
          treesitter = true,
          telescope = true,
          which_key = true,
          -- special
          indent_blankline = {
            enabled = true,
            -- colored_indent_levels = true,
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
        },
      }
      vim.cmd.colorscheme "catppuccin"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "契" },
        topdelete = { text = "契" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
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
    config = {
      options = {
        theme = "catppuccin",
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
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
    config = function()
      require("colorizer").setup {
        filetypes = { "*" },
        user_default_options = {
          names = false,
          RGB = false,
          RRGGBBAA = true,
        },
      }
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
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

      require("mini.basics").setup {
        options = {
          basic = true,
          extra_ui = false,
          win_borders = "bold",
        },
        mappings = {
          basic = true,
          option_toggle_prefix = [[\]],
          windows = true,
          move_with_alt = true,
        },
        autocommands = {
          basic = false,
          relnum_in_visual_mode = false,
        },
      }
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

      require("neo-tree").setup {
        close_if_last_window = true,
        default_component_configs = {
          modified = {
            symbol = "",
            highlight = "NeoTreeModified",
          },
        },
        window = {
          width = 35,
          mappings = {
            ["l"] = "open",
          },
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_by_name = {
              ".DS_Store",
              "thumbs.db",
              "node_modules",
              "__pycache__",
            },
            never_show = { -- remains hidden even if visible is toggled to true
              ".DS_Store",
              "thumbs.db",
              ".git",
            },
          },
          follow_current_file = true,
          use_libuv_file_watcher = true,
        },
      }
    end,
  },
}
