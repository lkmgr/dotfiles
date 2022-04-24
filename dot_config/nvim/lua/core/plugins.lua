local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    use {
      'rcarriga/nvim-notify',
      after = "telescope.nvim",
      config = function()
        require("configs.notify").config()
        require("telescope").load_extension "notify"
      end,
    }

    use {
      'MunifTanjim/nui.nvim',
      module = 'nui',
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
      config = function()
        require("configs.smart-splits").config()
      end,
    }

    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("configs.icons").config()
      end,
    }

    use {
      "akinsho/bufferline.nvim",
      after = "nvim-web-devicons",
      config = function()
        require("configs.bufferline").config()
      end,
    }

    use "moll/vim-bbye"

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
      config = function()
        require("configs.neo-tree").config()
      end,
    }

    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("configs.lualine").config()
      end,
    }


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
      config = function()
        require("configs.treesitter").config()
      end,
    }

    -- try nvim-treesitter-textobjects

    -- us {
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
      config = function()
        require("configs.comment").config()
      end,
    }


    -- LSP
    use {
      "neovim/nvim-lspconfig",
      event = "BufWinEnter",
      config = function()
        require("configs.lsp")
      end,
    }

    use {
      "williamboman/nvim-lsp-installer",
      -- after = "lspconfig",
      module = "nvim-lsp-installer",
      cmd = {
        "LspInstall",
        "LspInstallInfo",
        "LspPrintInstalled",
        "LspRestart",
        "LspStart",
        "LspStop",
        "LspUninstall",
        "LspUninstallAll",
      },
    }

    use {
      "hrsh7th/cmp-nvim-lsp",
      after = "nvim-cmp",
    }

    use "b0o/SchemaStore.nvim"

    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      event = { "BufRead", "BufNewFile" },
      config = function()
        require("configs.null-ls").config()
      end,
    }


    -- cmp
    use {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      config = function()
        require("configs.cmp").config()
      end,
    }

    use {
      "hrsh7th/cmp-buffer",
      after = "nvim-cmp",
    }

    use {
      "hrsh7th/cmp-path",
      after = "nvim-cmp",
    }


    -- Snippets
    use {
      "rafamadriz/friendly-snippets",
      after = "nvim-cmp",
    }

    use {
      "L3MON4D3/LuaSnip",
      after = "friendly-snippets",
      config = function()
        require("configs.luasnip").config()
      end,
    }

    use {
      "saadparwaiz1/cmp_luasnip",
      after = "nvim-cmp",
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
      config = function()
        require("configs.telescope").config()
      end,
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
      event = { "BufRead", "BufNewFile" },
      config = function()
        require("configs.gitsigns").config()
      end,
    }


    -- Dashboard
    use {
      "goolord/alpha-nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("alpha").setup(require("alpha.themes.startify").config)
      end,
    }


    -- Indent Guides
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("configs.indent-blankline").config()
      end,
    }


    -- which-key
    use {
      "folke/which-key.nvim",
      config = function()
        require("configs.which-key").config()
      end,
    }


    -- Terminal
    use {
      "akinsho/toggleterm.nvim",
      cmd = "ToggleTerm",
      module = { "toggleterm", "toggleterm.terminal" },
      config = function()
        require("configs.toggleterm").config()
      end,
    }


    -- colorscheme
    use {
      "olimorris/onedarkpro.nvim",
      config = function()
        require("configs.onedarkpro").config()
      end,
    }


    -- Smooth scrolling
    use {
      "karb94/neoscroll.nvim",
      event = { "BufRead", "BufNewFile" },
      config = function()
        require("configs.neoscroll").config()
      end,
    }


    --use {
    --  "catppuccin/nvim",
    --  as = "catppuccin",
    --  config = function()
    --    require("configs.catppuccin").config()
    --  end,
    --}

    if packer_bootstrap then
      require('packer').sync()
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
