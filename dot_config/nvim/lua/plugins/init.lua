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

  "nvim-pack/nvim-spectre",

  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function() require("notify").dismiss { silent = true, pending = true } end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
    },
    init = function() vim.notify = require "notify" end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = { default = true },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
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
    "RRethy/vim-illuminate",
    lazy = false,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
    -- event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set(
          "n",
          key,
          function() require("illuminate")["goto_" .. dir .. "_reference"](false) end,
          { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer }
        )
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local icons = require "config.icons"

      return {
        options = {
          icons_enabled = true,
          theme = "catppuccin",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "dashboard", "alpha", "neo-tree" },
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { "lazy", "man", "toggleterm", "trouble" },
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "▏",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
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
      show_help = false,
      show_keys = false,
      key_labels = {
        ["<leader>"] = "SPC",
        ["<space>"] = "SPC",
      },
      window = {
        border = "single",
      },
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
      wk.register {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>l"] = { name = "+lsp" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+options" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
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
    -- lazy = false,
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    opts = function()
      local nls = require "null-ls"
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.prettierd,
        },
      }
    end,
  },

  {
    "echasnovski/mini.bufremove",
    lazy = false,
    -- stylua: ignore
    keys = {
      { "<C-c>", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },

  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        animation = function() return 10 end,
      },
      symbol = "▏",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function() vim.b.miniindentscope_disable = true end,
      })
    end,
  },

  {
    "echasnovski/mini.splitjoin",
    opts = {
      mappings = { toggle = "gS" },
    },
  },

  {
    "echasnovski/mini.move",
    opts = {
      mappings = {
        left = "H",
        right = "L",
        down = "J",
        up = "K",
      },
    },
  },

  {
    "echasnovski/mini.trailspace",
    config = true,
  },

  -- {
  --   "echasnovski/mini.nvim",
  --   config = function()
  -- require("mini.tabline").setup()
  -- require("mini.bufremove").setup()
  -- require("mini.cursorword").setup()

  -- require("mini.splitjoin").setup {
  --   mappings = { toggle = "gS" },
  -- }

  -- require("mini.indentscope").setup {
  --   draw = {
  --     animation = function() return 10 end,
  --   },
  --   symbol = "▏",
  -- }

  -- require("mini.move").setup {
  --   mappings = {
  --     left = "H",
  --     right = "L",
  --     down = "J",
  --     up = "K",
  --   },
  -- }

  -- require("mini.basics").setup {
  --   options = {
  --     basic = true,
  --     extra_ui = false,
  --     win_borders = "bold",
  --   },
  --   mappings = {
  --     basic = true,
  --     option_toggle_prefix = [[\]],
  --     windows = true,
  --     move_with_alt = false,
  --   },
  --   autocommands = {
  --     basic = false,
  --     relnum_in_visual_mode = false,
  --   },
  -- }
  --   end,
  -- },

  {
    "akinsho/bufferline.nvim",
    lazy = false,
    keys = {
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    config = function()
      require("bufferline").setup {
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
        options = {
          close_command = function(n) require("mini.bufremove").delete(n, false) end,
          right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(_, _, diag)
            local icons = require("config.icons").diagnostics
            local ret = (diag.error and icons.Error .. diag.error .. " " or "")
              .. (diag.warning and icons.Warn .. diag.warning or "")
            return vim.trim(ret)
          end,
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "center",
            },
          },
        },
      }
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    init = function() vim.g.neo_tree_remove_legacy_commands = 1 end,
    config = function()
      require("neo-tree").setup {
        close_if_last_window = true,
        default_component_configs = {
          container = {
            right_padding = 1,
          },
          modified = {
            symbol = "",
            highlight = "NeoTreeModified",
          },
        },
        window = {
          width = 35,
          mappings = {
            ["<space>"] = "none",
            ["l"] = "open",
            ["a"] = { "add", config = { show_path = "relative" } },
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

      vim.api.nvim_create_autocmd("TermClose", {
        pattern = "*lazygit",
        callback = function()
          if package.loaded["neo-tree.sources.git_status"] then require("neo-tree.sources.git_status").refresh() end
        end,
      })
    end,
  },
}
