require('lazy').setup({
  "folke/tokyonight.nvim",
  "nvim-tree/nvim-web-devicons",
  "github/copilot.vim",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"}
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'}
  },
  {
    'yamatsum/nvim-cursorline',
  },
  {
    'akinsho/toggleterm.nvim',  -- Terminal integration for Neovim
    version = "*",  -- Use the latest version
    config = true  -- Enable default configuration
  },
  -- lsp
  {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  },
  -- cmp 候補出すやつ 
  {
    "L3MON4D3/LuaSnip",

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "saadparwaiz1/cmp_luasnip",
  }
})
