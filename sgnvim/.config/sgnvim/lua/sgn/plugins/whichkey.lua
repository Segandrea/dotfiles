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

-- [[ VISUAL ]]
whichkey.register({
  ['<leader>c'] = {
    name = '+[c]omment',
    b = '[b]lock toggle',
    l = '[l]ine toggle',
  },
}, { mode = 'v' })

-- [[ NORMAL ]]
-- Adding names for partial keybindings
whichkey.register({
  ['<leader>b'] = { name = '+[b]uffer' },
  ['<leader>c'] = {
    name = '+[c]omment',
    a = '[a]ppend at eol',
    b = '[b]lock toggle',
    l = '[l]ine toggle',
    j = '[j] below',
    k = '[k] above',
  },
  ['<leader>f'] = { name = '+[f]ile tree' },
  ['<leader>g'] = {
    name = '+[g]oto',
    n = '+[n]ext',
    p = '+[p]rev',
  },
  ['<leader>G'] = {
    name = '+[G]it',
    b = '+[b]lame',
    r = '+[r]eset',
  },
  ['<leader>l'] = {
    name = '+[l]sp',
    a = '[a]rgument swap forward',
    A = '[A]rgument swap backward',
  },
  ['<leader>t'] = { name = '+[t]elescope' },
  ['<leader>w'] = { name = '+[w]orkspaces' },
  ['<leader>z'] = { name = '+[z]en' },
  ['<leader>?'] = { name = '+trouble[?]' },
})
