return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    -- dependencies = { "RRethy/nvim-treesitter-textsubjects" },
    build = function()
      -- Called this way instead of :TSUpdate so no additional restart is required
      pcall(require("nvim-treesitter.install").update { with_sync = true })
    end,
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        ignore_install = { "comment" },
        highlight = { enable = true },
        indent = { enable = false },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<cr>",
            node_incremental = "<cr>",
            scope_incremental = "<nop>",
            node_decremental = "<bs>",
          },
        },
        -- textsubjects = {
        --   enable = true,
        --   prev_selection = ",", -- (Optional) keymap to select the previous selection
        --   keymaps = {
        --     ["<cr>"] = "textsubjects-smart",
        --     [";"] = "textsubjects-container-outer",
        --     ["i;"] = "textsubjects-container-inner",
        --   },
        -- },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      }
    end,
  },
}
