return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- dependencies = { "RRethy/nvim-treesitter-textsubjects" },
    -- build = function()
    --   -- Called this way instead of :TSUpdate so no additional restart is required
    --   pcall(require("nvim-treesitter.install").update { with_sync = true })
    -- end,
    build = ":TSUpdate",
    config = function()
      local ts_config = require "config.treesitter"

      require("nvim-treesitter.configs").setup {
        ensure_installed = ts_config.ensure_installed,
        -- ignore_install = { "comment" },
        highlight = {
          enable = true,
          disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = false },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<cr>",
            node_incremental = "<cr>",
            scope_incremental = false,
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
