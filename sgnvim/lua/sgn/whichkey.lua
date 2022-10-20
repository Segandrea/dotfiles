local whichkey = require('which-key')

whichkey.setup({
  plugins = {
    marks = false,
    registers = false,
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false,
    },
  },
  window = {
    border = 'double',
    margin = { 0, 0, 0, 0 },
    padding = { 1, 1, 1, 1 },
  },
  layout = {
    align = 'center',
  },
  triggers_blacklist = {
    n = { 'g' },
    v = { 'i', 'a' },
  },
})

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
