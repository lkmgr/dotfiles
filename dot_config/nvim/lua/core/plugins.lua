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
    use "MunifTanjim/nui.nvim"
    use { "kyazdani42/nvim-web-devicons", config = userconf "icons" }
    use {
      "antoinemadec/FixCursorHold.nvim",
      config = function()
        vim.g.cursorhold_updatetime = 100
      end,
    }

    use {
      "rcarriga/nvim-notify",
      config = function()
        require("configs.notify").config()
        require("telescope").load_extension "notify"
      end,
    }

    use { "mrjones2014/smart-splits.nvim", config = userconf "smart-splits" }

    -- Buffers
    use { "akinsho/bufferline.nvim", config = userconf "bufferline" }
    use "moll/vim-bbye"
    -- use "famiu/bufdelete.nvim"

    use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x", config = userconf "neo-tree" }

    use { "nvim-lualine/lualine.nvim", config = userconf "lualine" }
    -- use { "feline-nvim/feline.nvim", config = userconf "feline" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = userconf "treesitter" }
    use { "nvim-treesitter/nvim-treesitter-context", config = userconf "treesitter-context" }
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "windwp/nvim-ts-autotag"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    -- use "p00f/nvim-ts-rainbow"

    use { "numToStr/Comment.nvim", config = userconf "comment" }

    -- LSP/Diagnostics
    use {
      "williamboman/nvim-lsp-installer",
      config = function()
        require("configs.nvim-lsp-installer").config()
        require "configs.lsp"
      end,
    }
    use "neovim/nvim-lspconfig"
    use { "jose-elias-alvarez/null-ls.nvim", config = userconf "null-ls" }
    use { "j-hui/fidget.nvim", config = userconf "fidget" }
    use { "folke/trouble.nvim", config = userconf "trouble" }
    use "b0o/SchemaStore.nvim"

    -- cmp
    use { "hrsh7th/nvim-cmp", config = userconf "cmp" }
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"

    -- Snippets
    use { "L3MON4D3/LuaSnip", config = userconf "luasnip" }
    use "rafamadriz/friendly-snippets"

    -- Telescope
    use { "nvim-telescope/telescope.nvim", config = userconf "telescope" }
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
      config = function()
        require("telescope").load_extension "fzf"
      end,
    }

    -- Dashboard
    use { "goolord/alpha-nvim", config = userconf "alpha" }

    -- mini.nvim - Surround, Trailspace
    use { "echasnovski/mini.nvim", config = userconf "mini" }

    use { "lewis6991/gitsigns.nvim", config = userconf "gitsigns" }
    use { "lukas-reineke/indent-blankline.nvim", config = userconf "indent-blankline" }
    use { "folke/which-key.nvim", config = userconf "which-key" }
    use { "akinsho/toggleterm.nvim", config = userconf "toggleterm" }
    use { "karb94/neoscroll.nvim", config = userconf "neoscroll" }
    use { "windwp/nvim-autopairs", config = userconf "autopairs" }
    use { "rrethy/vim-hexokinase", run = "make hexokinase", config = userconf "hexokinase" }
    use "Shatur/neovim-session-manager"
    use "ggandor/lightspeed.nvim"

    -- colorscheme
    use { "olimorris/onedarkpro.nvim", config = userconf "onedarkpro" } -- TODO: fix lightspeed highlights

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
    auto_clean = true,
    compile_on_sync = true,
    snapshot_path = vim.fn.stdpath "config" .. "/snapshots",
  },
}
