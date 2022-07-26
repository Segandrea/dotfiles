local nabla = require('nabla')
local mappings = {
  p = {
    name = 'plugins',
    n = { nabla.popup, 'popup math' },
  }
}

local options = {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

require('which-key').register(mappings, options)
