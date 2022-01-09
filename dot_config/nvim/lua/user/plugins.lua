local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install your plugins here
return packer.startup({function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

  -- Colorschemes
  -- use "lunarvim/onedarker.nvim"
  use "folke/tokyonight.nvim"

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("user.plugins.cmp").setup()
    end,
  }
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "b0o/schemastore.nvim" -- autoload jsonls schemas

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("user.plugins.telescope").setup()
    end,
  }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("user.plugins.treesitter").setup()
    end,
  }
  use "p00f/nvim-ts-rainbow"

  -- Misc
  use "kyazdani42/nvim-web-devicons"
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("user.plugins.comment").setup()
    end,
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  }
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end,
  }
  use "romgrk/barbar.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end,
config = {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  }
}})

