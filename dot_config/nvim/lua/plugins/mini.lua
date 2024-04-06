return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })

      require("mini.surround").setup({
        mappings = {
          add = "ys",
          delete = "ds",
          find = "",
          find_left = "",
          highlight = "",
          replace = "cs",
          update_n_lines = "",

          -- Add this only if you don't want to use extended mappings
          suffix_last = "",
          suffix_next = "",
        },
        search_method = "cover_or_next",
      })

      -- Remap adding surrounding to Visual mode selection
      vim.keymap.del("x", "ys")
      vim.keymap.set("x", "gs", [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })

      -- Make special mapping for "add surrounding for line"
      -- vim.keymap.set("n", "yss", "ys_", { remap = true })

      require("mini.indentscope").setup({
        symbol = "│",
      })

      require("mini.pairs").setup()

      local statusline = require("mini.statusline")
      statusline.setup({
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            -- local git = statusline.section_git({ trunc_width = 100 })
            local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
            local filename = statusline.section_filename({ trunc_width = 140 })
            local fileinfo = statusline.section_fileinfo({ trunc_width = 1000 })
            local location = statusline.section_location({ trunc_width = 75 })
            local search = statusline.section_searchcount({ trunc_width = 50 })

            return statusline.combine_groups({
              { hl = mode_hl, strings = { mode } },
              -- { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
              { hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
              "%<", -- Mark general truncate point
              { hl = "MiniStatuslineFilename", strings = { filename } },
              "%=", -- End left alignment
              { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
              { hl = mode_hl, strings = { search, location } },
            })
          end,
          inactive = nil,
        },
        use_icons = true,
        set_vim_settings = false,
      })

      require("mini.bufremove").setup()

      require("mini.files").setup()

      require("mini.splitjoin").setup()

      -- require("mini.sessions").setup({
      --   autoread = true,
      --   autowrite = true,
      -- })
    end,
  },
}
