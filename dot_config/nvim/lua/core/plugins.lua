local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

local function userconf(name)
  return string.format('require("configs.%s").config()', name)
end

require("packer").startup {
  function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"

    use {
      "rcarriga/nvim-notify",
      after = "telescope.nvim",
      config = function()
        require("configs.notify").config()
        require("telescope").load_extension "notify"
      end,
    }

    use {
      "MunifTanjim/nui.nvim",
      module = "nui",
    }

    use {
      "antoinemadec/FixCursorHold.nvim",
      event = { "BufRead", "BufNewFile" },
      config = function()
        vim.g.cursorhold_updatetime = 100
      end,
    }

    use {
      "mrjones2014/smart-splits.nvim",
      module = "smart-splits",
      config = userconf "smart-splits",
    }

    use {
      "kyazdani42/nvim-web-devicons",
      config = userconf "icons",
    }

    use {
      "akinsho/bufferline.nvim",
      after = "nvim-web-devicons",
      config = userconf "bufferline",
    }

    use "moll/vim-bbye"
    -- use {
    --   "famiu/bufdelete.nvim",
    --   cmd = { "Bdelete", "Bwipeout" },
    -- }

    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      module = "neo-tree",
      cmd = "Neotree",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      setup = function()
        vim.g.neo_tree_remove_legacy_commands = true
      end,
      config = userconf "neo-tree",
    }

    -- Statusline
    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = userconf "lualine",
    }
    -- use {
    --   "feline-nvim/feline.nvim",
    --   config = userconf "feline",
    -- }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      event = { "BufRead", "BufNewFile" },
      cmd = {
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
        "TSDisableAll",
        "TSEnableAll",
      },
      config = userconf "treesitter",
    }

    -- try nvim-treesitter-textobjects

    -- use {
    --   "p00f/nvim-ts-rainbow",
    --   after = "nvim-treesitter",
    -- }

    use {
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
    }

    use {
      "JoosepAlviste/nvim-ts-context-commentstring",
      after = "nvim-treesitter",
    }

    -- Comments
    use {
      "numToStr/Comment.nvim",
      event = { "BufRead", "BufNewFile" },
      config = userconf "comment",
    }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      module = "lspconfig",
      opt = true,
      setup = function()
        require("core.utils").defer_plugin "nvim-lspconfig"
      end,
      -- tag = "v0.1.3",
    }

    use {
      "williamboman/nvim-lsp-installer",
      after = "nvim-lspconfig",
      config = function()
        require("configs.nvim-lsp-installer").config()
        require "configs.lsp"
      end,
    }

    use "b0o/SchemaStore.nvim"

    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      event = { "BufRead", "BufNewFile" },
      config = userconf "null-ls",
    }

    use {
      "j-hui/fidget.nvim",
      config = userconf "fidget",
    }

    -- cmp
    use {
      "hrsh7th/nvim-cmp",
      -- event = "InsertEnter",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
      },
      config = userconf "cmp",
    }

    use {
      "L3MON4D3/LuaSnip",
      -- after = "friendly-snippets",
      config = userconf "luasnip",
    }

    -- telescope
    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      module = "telescope",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
      },
      config = userconf "telescope",
    }

    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      after = "telescope.nvim",
      run = "make",
      config = function()
        require("telescope").load_extension "fzf"
      end,
    }

    -- Git integration
    use {
      "lewis6991/gitsigns.nvim",
      opt = true,
      setup = function()
        require("core.utils").defer_plugin "gitsigns.nvim"
      end,
      config = userconf "gitsigns",
    }

    -- Dashboard
    use {
      "goolord/alpha-nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = userconf "alpha",
    }

    -- Indent Guides
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = userconf "indent-blankline",
    }

    -- which-key
    use {
      "folke/which-key.nvim",
      config = userconf "which-key",
    }

    -- Terminal
    use {
      "akinsho/toggleterm.nvim",
      cmd = "ToggleTerm",
      module = { "toggleterm", "toggleterm.terminal" },
      config = userconf "toggleterm",
    }

    -- Smooth scrolling
    use {
      "karb94/neoscroll.nvim",
      event = { "BufRead", "BufNewFile" },
      config = userconf "neoscroll",
    }

    -- Autopairs
    use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = userconf "autopairs",
    }

    -- Lightspeed
    -- TODO: Fix highlighting for f/F/t/T with onedarkpro
    use "ggandor/lightspeed.nvim"

    -- mini.nvim - Surround, Trailspace
    use {
      "echasnovski/mini.nvim",
      config = userconf "mini",
    }

    -- Trouble
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = userconf "trouble",
    }

    -- colorscheme
    use {
      "olimorris/onedarkpro.nvim",
      config = userconf "onedarkpro",
    }

    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  },
}
