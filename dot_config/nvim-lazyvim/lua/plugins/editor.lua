return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    -- opts = {
    --   window = {
    --     mappings = {
    --       ["l"] = "open",
    --     },
    --   },
    --   filesystem = {
    --     filtered_items = {
    --       visible = true,
    --       hide_dotfiles = false,
    --       hide_by_name = {
    --         ".DS_Store",
    --         "thumbs.db",
    --         "node_modules",
    --         "__pycache__",
    --       },
    --       never_show = { -- remains hidden even if visible is toggled to true
    --         ".DS_Store",
    --         "thumbs.db",
    --         ".git",
    --       },
    --     },
    --     follow_current_file = {
    --       enabled = true,
    --     },
    --   },
    -- },
  },

  {
    "echasnovski/mini.files",
    opts = {
      mappings = {
        close = "q",
        go_in = "l",
        go_in_plus = "L",
        go_out = "h",
        go_out_plus = "H",
        reset = "<BS>",
        reveal_cwd = "@",
        show_help = "g?",
        synchronize = "=",
        trim_left = "<",
        trim_right = ">",
        -- close = "q",
        -- go_in = "<Right>",
        -- go_in_plus = "<S-Right>",
        -- go_out = "<Left>",
        -- go_out_plus = "<S-Left>",
        -- reset = "<BS>",
        -- reveal_cwd = "@",
        -- show_help = "g?",
        -- synchronize = "=",
        -- trim_left = "<",
        -- trim_right = ">",
      },
      options = {
        use_as_default_explorer = true,
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = "❯ ",
        path_display = { "truncate" },
        layout_strategy = "vertical",
        layout_config = {
          width = 0.85,
          height = 0.85,
        },
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
