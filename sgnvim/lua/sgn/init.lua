require('sgn.options')
require('sgn.mappings')
require('sgn.autocmds')

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}

  -- Use treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Use language server protocols
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'

end)

require('sgn.plugins.treesitter')
--lsp-installer must be configured before lsp-config
require('sgn.plugins.lspinstaller')
require('sgn.plugins.lspconfig')
