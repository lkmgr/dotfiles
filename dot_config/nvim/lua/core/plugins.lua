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

local function conf(name) return string.format('require("configs.%s")', name) end
local function callsetup(name) return string.format('require("%s").setup()', name) end

require("packer").startup {
  function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "lewis6991/impatient.nvim"
    use "MunifTanjim/nui.nvim"
    use "stevearc/dressing.nvim"
    use { "kyazdani42/nvim-web-devicons", config = conf "icons" }

    use { "rcarriga/nvim-notify", config = conf "notify" }

    use { "mrjones2014/smart-splits.nvim", config = conf "smart-splits" }

    use { "akinsho/bufferline.nvim", config = conf "bufferline" }

    use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x", config = conf "neo-tree" }

    use { "nvim-lualine/lualine.nvim", config = conf "lualine" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = conf "treesitter" }
    use { "nvim-treesitter/nvim-treesitter-context", config = callsetup "treesitter-context" }
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "RRethy/nvim-treesitter-textsubjects"
    use "windwp/nvim-ts-autotag"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    -- use "p00f/nvim-ts-rainbow"

    use { "numToStr/Comment.nvim", config = conf "comment" }

    -- LSP/Diagnostics
    use { "williamboman/mason.nvim", config = callsetup "mason" }
    use { "williamboman/mason-lspconfig.nvim", config = conf "lsp" }
    use "neovim/nvim-lspconfig"
    use { "jose-elias-alvarez/null-ls.nvim", config = conf "null-ls" }
    use { "j-hui/fidget.nvim", config = conf "fidget" }
    use { "folke/trouble.nvim", config = conf "trouble" }
    use "b0o/SchemaStore.nvim"

    use {
      "hrsh7th/nvim-cmp",
      config = conf "cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
      },
    }

    -- Snippets
    use {
      "L3MON4D3/LuaSnip",
      config = function() require("luasnip/loaders/from_vscode").lazy_load() end,
    }
    use "rafamadriz/friendly-snippets"

    -- Telescope
    use { "nvim-telescope/telescope.nvim", config = conf "telescope" }
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
      config = function() require("telescope").load_extension "fzf" end,
    }

    -- mini.nvim
    use { "echasnovski/mini.nvim", config = conf "mini" }

    -- Surround
    -- use { "kylechui/nvim-surround", config = conf "surround" }
    use { "kylechui/nvim-surround", config = callsetup "nvim-surround" }

    -- DAP
    use { "mfussenegger/nvim-dap", config = conf "dap" }
    use { "rcarriga/nvim-dap-ui" }

    -- Git
    use { "lewis6991/gitsigns.nvim", config = conf "gitsigns" }
    use { "sindrets/diffview.nvim", config = conf "diffview" }

    use { "lukas-reineke/indent-blankline.nvim", config = conf "indent-blankline" }
    use { "folke/which-key.nvim", config = conf "which-key" }
    use { "akinsho/toggleterm.nvim", config = conf "toggleterm" }
    use { "windwp/nvim-autopairs", config = conf "autopairs" }
    -- use { "rrethy/vim-hexokinase", run = "make hexokinase", config = conf "hexokinase" }
    use { "NvChad/nvim-colorizer.lua", config = conf "colorizer" }
    use { "ggandor/lightspeed.nvim" }

    -- Colorschemes
    -- use { "catppuccin/nvim", as = "catppuccin", config = conf "catppuccin" }
    -- use { "rose-pine/neovim", as = "rose-pine", tag = "v1.*", config = conf "rosepine" }
    -- use { "rebelot/kanagawa.nvim", config = conf "kanagawa" }
    use { "EdenEast/nightfox.nvim", config = conf "themes.nightfox" }

    if packer_bootstrap then require("packer").sync() end
  end,
  config = {
    display = {
      open_fn = function() return require("packer.util").float { border = "rounded" } end,
    },
    auto_clean = true,
    compile_on_sync = true,
    snapshot_path = vim.fn.stdpath "config" .. "/snapshots",
  },
}
