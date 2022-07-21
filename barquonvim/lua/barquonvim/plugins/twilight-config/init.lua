--there should not be the need to do require('twilight').setup()
local twilight = require('twilight')
twilight.setup()

-- [[ Mappings ]]
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
    t = { twilight.toggle, 'Toggle twilight' },
  },
}

require('which-key').register(mappings, options)
