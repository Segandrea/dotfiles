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

  -- Use whichkey to show keybindings
  use 'folke/which-key.nvim'

end)

-- configure treesitter
require('sgn.plugins.treesitter')
-- lsp-installer must be configured before lsp-config
require('sgn.plugins.lspinstaller')
require('sgn.plugins.lspconfig')
-- configure whichkey
require('sgn.plugins.whichkey')
