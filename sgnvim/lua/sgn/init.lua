--[[ Basic configurations ]]
require('sgn.options')
require('sgn.mappings')
require('sgn.autocmds')

--[[ List of packages ]]
require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}
  -- Use treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'
  -- Use language server protocols
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  -- Completions
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- Use whichkey to show keybindings
  use 'folke/which-key.nvim'
  -- Seamless navigation between tmux panes
  use 'aserowy/tmux.nvim'
end)



--[[ Configurations for the various plugins ]]
-- configure treesitter with rainbow
require('sgn.plugins.treesitter')
-- lsp-installer must be configured before lsp-config
require('sgn.plugins.lspinstaller')
require('sgn.plugins.lspconfig')
-- completion
require('sgn.plugins.completion')
-- configure whichkey
require('sgn.plugins.whichkey')
-- configure tmux.nvim
require('sgn.plugins.tmux')
