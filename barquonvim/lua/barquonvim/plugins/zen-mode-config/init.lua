local zen = require('zen-mode')
zen.setup({
  window = {
    width = 90,
    options = {
      signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      relativenumber = false, -- disable relative numbers
      cursorline = false, -- disable cursorline
      cursorcolumn = false, -- disable cursor column
      foldcolumn = "0", -- disable fold column
      list = false, -- disable whitespace characters
    },
  },
  plugins = {
    tmux = { enabled = true },
  },
})

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
    z = { zen.toggle, 'Toggle zen-mode' },
  },
}

require('which-key').register(mappings, options)
