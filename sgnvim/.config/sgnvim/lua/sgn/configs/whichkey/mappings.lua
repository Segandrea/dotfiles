local whichkey = require('which-key')

-- [[ VISUAL ]]
whichkey.register({
  ['<leader>a'] = { name = '+[a]lign' },
  ['<leader>c'] = { name = '+[c]omment',
    b = '[b]lock toggle',
    l = '[l]ine toggle',
  },
  ['<leader>s'] = { name = '+[s]urround' },
}, { mode = 'v' })

-- [[ NORMAL ]]
-- Adding names for partial keybindings
whichkey.register({
  ['<leader>b'] = { name = '+[b]uffer' },
  ['<leader>c'] = { name = '+[c]omment',
    a = '[a]ppend at eol',
    b = '[b]lock toggle',
    l = '[l]ine toggle',
    j = '[j] new below',
    k = '[k] new above',
  },
  ['<leader>f'] = { name = '+[f]ile tree' },
  ['<leader>g'] = { name = '+[g]oto',
    n = '+[n]ext',
    p = '+[p]rev',
  },
  ['<leader>G'] = { name = '+[G]it',
    b = '+[b]lame',
    r = '+[r]eset',
  },
  ['<leader>l'] = { name = '+[l]sp',
    a = '[a]rgument swap forward',
    A = '[A]rgument swap backward',
  },
  ['<leader>s'] = { name = '+[s]urround',
    c = '[c]hange',
    d = '[d]elete',
    l = '[l]ine',
  },
  ['<leader>t'] = { name = '+[t]elescope' },
  ['<leader>w'] = { name = '+[w]orkspaces' },
  ['<leader>z'] = { name = '+[z]en' },
  ['<leader>?'] = { name = '+trouble[?]' },
})

-- [[ KEYS TO IGNORE ]]
whichkey.register({
  ['<leader>wq'] = 'which_key_ignore',
  ['<leader>q'] = 'which_key_ignore',
  ['y'] = 'which_key_ignore', -- ignored because nvim-surround
  ['['] = 'which_key_ignore', -- ignored because nvim-surround
  [']'] = 'which_key_ignore', -- ignored because nvim-surround
})
