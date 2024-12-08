return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        -- transparent_background = true,
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.15,
        },
        integrations = {
          fidget = true,
          gitsigns = true,
          indent_blankline = {
            enabled = true,
          },
          leap = true,
          markdown = true,
          mason = true,
          mini = {
            enabled = true,
          },
          cmp = true,
          native_lsp = {
            enabled = true,
          },
          treesitter = true,
          telescope = {
            enabled = true,
          },
          lsp_trouble = true,
          which_key = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "storm",
  --       transparent = true,
  --       on_colors = function(colors)
  --         colors.border = colors.orange
  --       end,
  --     })
  --
  --     vim.cmd.colorscheme("tokyonight")
  --
  --     -- vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
}
