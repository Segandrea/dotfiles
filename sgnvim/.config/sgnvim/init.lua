-- [[ Essential settings ]]
require('sgn.base')

-- TODO : packer bootstrap
-- TODO: packer autoinstall plugins when saving this file

return require('packer').startup({
  function(use)
    -- Impatient speeds up neovim startup
    use({ 'lewis6991/impatient.nvim' })
    require('impatient') -- Calling impatient here reduces the startup time

    use(require('sgn.configs')) -- Other plugins
  end,
  config = require('sgn.configs.packer.config')
})
