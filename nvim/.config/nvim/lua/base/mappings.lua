return {
  -- Insert Mode mappings
  {
    desc = 'Disable ctrl-j',
    mode = 'i', key = '<C-j>', act = '<Nop>',
  },
  {
    desc = 'Disable ctrl-k',
    mode = 'i', key = '<C-k>', act = '<Nop>',
  },
  {
    desc = 'Ctrl-backspace to delete the word',
    mode = 'i', key = '<C-h>', act = '<C-w>', -- NB. Backspace is registered as <C-h> from terminal
  },
  -- Normal Mode mappings
  {
    desc = 'Paste and go to the end of the pasted text',
    mode = 'n', key = 'p', act = 'p`]'
  },
  {
    desc = 'Paste and go to the end of the pasted text',
    mode = 'n', key = 'P', act = 'P`]'
  },
  {
    desc = 'Break line opposite of J',
    mode = 'n', key = 'K', act = 'a<CR><Esc>k$'
  },
  {
    desc = 'Send old text after a c change to an unused register',
    mode = 'n', key = 'c', act = '"_c',
  },
  {
    desc = 'Send old text after a C change to an unused register',
    mode = 'n', key = 'C', act = '"_C',
  },
  {
    desc = 'Send old text after a x deletion to an unused register',
    mode = { 'n', 'v' }, key = 'x', act = '"_x',
  },
  {
    desc = 'Send old text after a X deletion to an unused register',
    mode = { 'n', 'v' }, key = 'X', act = '"_X',
  },
  {
    desc = 'Send old text after a s substitution to an unused register',
    mode = { 'n', 'v' }, key = 's', act = '"_s',
  },
  {
    desc = 'Disable space to use as leader key',
    mode = 'n', key = '<Space>', act = '<Nop>',
  },
  {
    desc = '~ with movements',
    mode = 'n', key = '~', act = 'g~',
  },
  {
    desc = 'Center and highlight next search',
    mode = 'n', key = 'n', act = ':set<space>hlsearch<cr>nzzzv',
  },
  {
    desc = 'Center and highlight prev search',
    mode = 'n', key = 'N', act = ':set<space>hlsearch<cr>Nzzzv',
  },
  {
    desc = 'Indent to right',
    mode = 'n', key = '>', act = '>>',
  },
  {
    desc = 'Indent to left',
    mode = 'n', key = '<', act = '<<',
  },
  {
    desc = 'Deactivate highlight',
    mode = 'n', key = '<Esc>', act = ':set<space>nohlsearch<cr><esc>',
  },
  {
    desc = 'Mark starting point and highlight next searched word',
    mode = 'n', key = '/', act = ':set<space>hlsearch<cr>mb/',
  },
  {
    desc = 'Mark starting point and highlight next match',
    mode = 'n', key = '*', act = ':set<space>hlsearch<cr>mb*',
  },
  {
    desc = 'Mark starting point and highlight prev searched word',
    mode = 'n', key = '?', act = ':set<space>hlsearch<cr>mb?',
  },
  {
    desc = 'Mark starting point and highlight prev match',
    mode = 'n', key = '#', act = ':set<space>hlsearch<cr>mb#',
  },
  {
    desc = 'Navigate up through wrapped lines',
    mode = 'n', key = 'k', act = "v:count == 0 ? 'gk' : 'k'", expr = true,
  },
  {
    desc = 'Navigate down through wrapped lines',
    mode = 'n', key = 'j', act = "v:count == 0 ? 'gj' : 'j'", expr = true,
  },
  {
    desc = '[U]ndo the undone',
    mode = 'n', key = 'U', act = '<C-r>',
  },
  -- Basic go to mappings
  {
    desc = 'Go to line start [H]',
    mode = { 'o', 'n', 'v' }, key = 'H', act = '^', noremap = false,
  },
  {
    desc = 'Go to line end [L]',
    mode = { 'o', 'n', 'v' }, key = 'L', act = '$', noremap = false,
  },
  {
    desc = '[t]ab',
    mode = 'n', key = 'gnt', act ='gt',
  },
  {
    desc = '[t]ab',
    mode = 'n', key = 'gpt', act ='gT',
  },
  {
    desc = 'searched and [s]elect',
    mode = 'n', key = 'gns', act ='gn',
  },
  {
    desc = 'searched and [s]elect',
    mode = 'n', key = 'gps', act ='gN',
  },
  {
    desc = '[r]eselect last selection',
    mode = 'n', key = 'gr', act = 'gv',
  },
  {
    desc = '[b]ack',
    mode = 'n', key = 'gb', act = "'b",
  },
  {
    desc = '[f]old',
    mode = 'n', key = 'gnf', act = 'zj',
  },
  {
    desc = '[f]old',
    mode = 'n', key = 'gpf', act = 'zk',
  },
  -- Visual Mode mappings
  {
    desc = 'Move current line above',
    mode = 'v', key = 'K', act = ":m<space>'<-2<cr>gv=gv",
  },
  {
    desc = 'Move current line below',
    mode = 'v', key = 'J', act = ":m<space>'>+1<cr>gv=gv",
  },
  {
    desc = 'Increment and keep selection',
    mode = 'v', key = '<C-a>', act = '<C-a>gv',
  },
  {
    desc = 'Decrement and keep selection',
    mode = 'v', key = '<C-x>', act = '<C-x>gv',
  },
  {
    desc = 'Progressive increment in selection',
    mode = 'v', key = 'g<C-a>', act = 'g<C-a>gv',
  },
  {
    desc = 'Progressive decrement in selection',
    mode = 'v', key = 'g<C-x>', act = 'g<C-x>gv',
  },
  {
    desc = 'Indent right and keep selection',
    mode = 'v', key = '>', act = '>gv',
  },
  {
    desc = 'Indent left and keep selection',
    mode = 'v', key = '<', act = '<gv',
  },
  {
    desc = 'Disable space',
    mode = 'v', key = '<Space>', act = '<Nop>',
  },
  {
    desc = 'Yank keeping cursor position',
    mode = 'v', key = 'y', act = 'ygv<Esc>'
  },
}
