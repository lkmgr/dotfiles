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

    use "lewis6991/impatient.nvim"

    use {
      "rcarriga/nvim-notify",
      config = function()
        require("configs.notify").config()
        require("telescope").load_extension "notify"
      end,
    }

    use "MunifTanjim/nui.nvim"

    use {
      "antoinemadec/FixCursorHold.nvim",
      config = function()
        vim.g.cursorhold_updatetime = 100
      end,
    }

    use {
      "mrjones2014/smart-splits.nvim",
      config = userconf "smart-splits",
    }

    use {
      "kyazdani42/nvim-web-devicons",
      config = userconf "icons",
    }

    use {
      "akinsho/bufferline.nvim",
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
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
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
      config = userconf "treesitter",
    }

    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "windwp/nvim-ts-autotag"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    -- use "p00f/nvim-ts-rainbow"

    -- Comments
    use {
      "numToStr/Comment.nvim",
      config = userconf "comment",
    }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
    }

    use {
      "williamboman/nvim-lsp-installer",
      config = function()
        require("configs.nvim-lsp-installer").config()
        require "configs.lsp"
      end,
    }

    use "b0o/SchemaStore.nvim"

    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = userconf "null-ls",
    }

    use {
      "j-hui/fidget.nvim",
      config = userconf "fidget",
    }

    -- cmp
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
      },
      config = userconf "cmp",
    }

    use {
      "L3MON4D3/LuaSnip",
      config = userconf "luasnip",
    }

    -- telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
      },
      config = userconf "telescope",
    }

    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
      config = function()
        require("telescope").load_extension "fzf"
      end,
    }

    -- Git integration
    use {
      "lewis6991/gitsigns.nvim",
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
      config = userconf "toggleterm",
    }

    -- Smooth scrolling
    use {
      "karb94/neoscroll.nvim",
      config = userconf "neoscroll",
    }

    -- Autopairs
    use {
      "windwp/nvim-autopairs",
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
