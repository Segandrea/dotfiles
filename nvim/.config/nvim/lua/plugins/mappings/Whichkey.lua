local whichkey = require('which-key')

-- [[ NORMAL go to ]]
whichkey.register({
  g = {
    name = '+[g]o to',
    n = '+[n]ext',
    p = '+[p]rev',
    f = '[f]ile',
    x = '[x]dg-open file',
  }
})
-- [[ NORMAL git ]]
whichkey.register({
  ['<leader>g'] = {
    name = '+[g]it',
    r = '+[r]eset',
    s = '+[s]tage',
  }
})

-- [[ NORMAL lsp ]]
whichkey.register({
  ['<leader>l'] = '+[l]sp',
})

-- [[ NORMAL treesitter ]]
whichkey.register({
  ['<leader>s'] = '+[s]wap',
})

-- [[ NORMAL telescope ]]
whichkey.register({
  ['<leader>t'] = '+[t]elescope',
})

-- [[ NORMAL ]]
whichkey.register({
  ['<leader>/'] = {
    name = '+[/]comment',
    b = {
      name = '+[b]lock',
      b = '[b]lock toggle',
    },
    ['/'] = '[/]line toggle',
    A = '[A]ppend',
    o = '[o]pen below',
    O = '[O]pen above',
  }
})

-- [[ VISUAL ]]
--[[
whichkey.register({
  ['<leader>a'] = { name = '+[a]lign' },
  ['<leader>c'] = { name = '+[c]omment',
    b = '[b]lock toggle',
    l = '[l]ine toggle',
  },
  ['<leader>s'] = { name = '+[s]urround' },
}, { mode = 'v' })
--]]

--[[
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
  ['<leader>?'] = { name = '+trouble[?]' },
})
--]]

-- [[ KEYS TO IGNORE ]]
whichkey.register({
  ['>'] = 'which_key_ignore',
  ['<'] = 'which_key_ignore',
  ['[%'] = 'which_key_ignore',
  [']%'] = 'which_key_ignore',
  ['cs'] = 'which_key_ignore',
  ['ds'] = 'which_key_ignore',
  ['gv'] = 'which_key_ignore',
  ['gN'] = 'which_key_ignore',
  ['gt'] = 'which_key_ignore',
  ['gT'] = 'which_key_ignore',
  ['g%'] = 'which_key_ignore',
})
