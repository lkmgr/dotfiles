local M = {}

function M.config()
  local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  treesitter.setup {
    -- integrated
    ensure_installed = "all",
    sync_install = false,
    ignore_install = {},
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false, -- true?
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
      enable = false, -- true? -- disable for yaml?
    },

    ---- external modules
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
end

return M

