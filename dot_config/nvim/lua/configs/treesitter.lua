local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup {
  -- integrated
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "phpdoc" }, -- not working on ARM Mac
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false, -- check if needed
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    -- enable = false,
    enable = true,
    disable = { "yaml" },
  },

  ---- external modules
  -- nvim-treesitter-textobjects
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["gz"] = "@parameter.inner",
      },
      swap_previous = {
        ["gZ"] = "@parameter.inner",
      },
    },
  },

  -- nvim-treesitter-textsubjects
  textsubjects = {
    enable = true,
    -- prev_selection = ",", -- (Optional) keymap to select the previous selection
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
      ["i;"] = "textsubjects-container-inner",
    },
  },

  -- nvim-ts-rainbow
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 10000,
  },

  -- nvim-ts-autotag
  autotag = {
    enable = true,
  },

  -- nvim-ts-context-commentstring
  context_commentstring = {
    enable = true,
    enable_autocmd = false, -- configured with Comment.nvim
  },
}
