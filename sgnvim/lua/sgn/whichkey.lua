local whichkey = require('which-key')

whichkey.setup({
  plugins = {
    registers = false,
  },
  presets = {
    operators = false,
    motions = false,
    text_objects = false,
  },
  window = {
    border = 'shadow',
  },
})

local presets = require("which-key.plugins.presets")
presets.operators["v"] = nil
presets.operators["V"] = nil
presets.operators["d"] = nil
presets.operators["y"] = nil
presets.operators["c"] = nil
presets.operators["g"] = nil

-- Adding names for partial keybindings
whichkey.register({
  ['<leader>d'] = { name = '+diff' },
  ['<leader>g'] = { name = '+goto' },
  ['<leader>l'] = { name = '+lsp' },
  ['<leader>m'] = { name = '+markdown' },
  ['<leader>t'] = { name = '+telescope' },
  ['<leader>w'] = { name = '+workspaces' },
  ['<leader>z'] = { name = '+zen' },
  ['<leader>?'] = { name = '+trouble?' },
})
