-- [[ Mappings for zen zen-mode ]]
local zen = require('zen-mode')
-- options
local options = {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil, -- global settings, specifying a buffer makes it local to that
  silent = true,
  noremap = true,
  nowait = false,
}

local mappings = {
  p = {
    name = 'plugins',
    z = { zen.toggle, 'Toggle zen-mode' },
  },
}

require('which-key').register(mappings, options)
