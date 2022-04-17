local config = {

  -- Set colorscheme
  colorscheme = "default_theme",

  -- Default theme configuration
  default_theme = {
    diagnostics_style = "none",
    -- Modify the color table
    -- colors = {
    --   fg = "#abb2bf",
    -- },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- Disable default plugins
  enabled = {
    bufferline = true,
    nvim_tree = true,
    lualine = true,
    gitsigns = true,
    colorizer = true,
    toggle_term = true,
    comment = true,
    symbols_outline = true,
    indent_blankline = true,
    dashboard = true,
    which_key = true,
    neoscroll = true,
    ts_rainbow = true,
    ts_autotag = true,
  },

  -- Configure plugins
  plugins = {
    init = function(plugins)
      local my_plugins = {
        -- { "andweeb/presence.nvim" },
        -- {
        --   "ray-x/lsp_signature.nvim",
        --   event = "BufRead",
        --   config = function()
        --     require("lsp_signature").setup()
        --   end,
        -- },
      }

      plugins["max397574/better-escape.nvim"] = nil

      return vim.tbl_deep_extend("force", plugins, my_plugins)
    end,
    -- All other entries override the setup() call for default plugins
    -- treesitter = {
    --   ensure_installed = { "lua" },
    -- },
    -- packer = {
    --   compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    -- },
    ["nvim-tree"] = {
      actions = {
        open_file = {
          resize_window = true
        },
      },
    },
  },

  -- Add paths for including more VS Code style snippets in luasnip
  luasnip = {
    vscode_snippet_paths = {},
  },

  ["which-key"] = {
    register_n_leader = {
      f = {
        name = "Telescope",
        ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        f = { "<cmd>Telescope find_files<cr>", "Files" },
        F = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "All Files" },
        g = { "<cmd>Telescope live_grep<cr>", "Grep" },
        h = { "<cmd>Telescope oldfiles<cr>", "History" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        n = { "<cmd>Telescope notify<cr>", "Notifications" },
        p = { "<cmd>Telescope project<cr>", "Projects" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope colorscheme<cr>", "Themes" },
      },
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   server:setup(opts)
    -- end

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = false,
    underline = true,
  },

  -- null-ls configuration
  ["null-ls"] = function()
    -- Formatting and linting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return
    end

    -- Check supported formatters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting

    -- Check supported linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
      -- debug = false,
      -- sources = {
        -- Set a formatter
        -- formatting.rufo,
        -- Set a linter
        -- diagnostics.rubocop,
      -- },
      -- NOTE: You can remove this on attach function to disable format on save
      -- on_attach = function(client)
      --   if client.resolved_capabilities.document_formatting then
      --     vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      --   end
      -- end,
    }
  end,

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_set_keymap
    local unmap = vim.api.nvim_del_keymap
    local set = vim.opt

    -- Set options
    set.cursorline = true
    set.expandtab = true
    set.iskeyword:append({ '-' })
    set.number = true
    set.relativenumber = false
    set.whichwrap = 'b,s,<,>,[,]'

    -- Unmap existing key bindings
    unmap("n", "{");
    unmap("n", "}");

    -- normal mode
    map("n", "<C-s>", ":w!<CR>", opts)
    map("n", "<A-j>", ":m .+1<CR>==", opts)
    map("n", "<A-k>", ":m .-2<CR>==", opts)

    -- visual block mode
    map("x", "J", ":move '>+1<CR>gv-gv", opts)
    map("x", "K", ":move '<-2<CR>gv-gv", opts)

    -- Set autocommands
    vim.cmd [[
      augroup packer_conf
        autocmd!
        autocmd bufwritepost plugins.lua source <afile> | PackerSync
      augroup end
    ]]
  end,
}

return config
