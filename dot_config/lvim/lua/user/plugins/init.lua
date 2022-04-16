-- Additional Plugins
lvim.plugins = {
  -- {"folke/tokyonight.nvim"},
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    setup = function()
      require("user.plugins.trouble").config()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- event = "BufRead",
    config = function()
      require("user.plugins.indent-blankline").config()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("user.plugins.nvim-colorizer").config()
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  {
    "tpope/vim-surround",
    keys = {"c", "d", "y"},
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("user.plugins.catppuccin").config()
      vim.cmd [[colorscheme catppuccin]]
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("user.plugins.neoscroll").config()
    end,
  },
}

