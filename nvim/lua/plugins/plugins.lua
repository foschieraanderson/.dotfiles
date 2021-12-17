vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-lua/popup.nvim', requires = {'nvim-lua/plenary.nvim'} }
  use 'kyazdani42/nvim-web-devicons'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
  'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use {'norcalli/nvim-colorizer.lua'}
  use { "nvim-treesitter/nvim-treesitter"}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  }
  use {"akinsho/toggleterm.nvim"}
  use 'b3nj5m1n/kommentary'
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'},} -- tag = 'release' -- To use the latest release
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'iamcco/markdown-preview.nvim' }
  -- Autocomplete
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer', requires = {'neovim/nvim-lspconfig'} }
  use { 'glepnir/lspsaga.nvim', requires = {'neovim/nvim-lspconfig'} }
  use { 'hrsh7th/nvim-compe'}
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'ray-x/lsp_signature.nvim'
  use 'onsails/lspkind-nvim'
end)
