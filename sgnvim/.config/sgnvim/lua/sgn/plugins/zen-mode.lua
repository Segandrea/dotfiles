require('twilight').setup()
require('zen-mode').setup({
  window = {
    backdrop = 1,
    width = .85,
    options = {
      signcolumn = 'no',
      number = false,
      relativenumber = false,
      cursorline = false,
      cursorcolumn = false,
      list = false,
    },
  },
  plugins = {
    twilight = { enabled = false, },
    tmux = { enabled = false, },
  },
})

-- [[ Mappings ]]
local map = require('sgn.core.mapper').map
map({
  { mode = 'n', key = '<leader>zt', act = require('twilight').toggle, desc = '[t]wilight', },
  { mode = 'n', key = '<leader>zz', act = require('zen-mode').toggle, desc = '[z]en mode', },
})
