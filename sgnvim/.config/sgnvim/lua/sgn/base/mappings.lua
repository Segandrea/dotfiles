return {
  -- Insert Mode mappings
  {
    desc = 'Go right instead of tab',
    mode = 'i', key = '<Tab>', act = '<Right>',
  },
  {
    desc = 'Disable shift-tab',
    mode = 'i', key = '<S-Tab>', act = '<Nop>',
  },
  {
    desc = 'Disable ctrl-j',
    mode = 'i', key = '<C-j>', act = '<Nop>',
  },
  {
    desc = 'Disable ctrl-k',
    mode = 'i', key = '<C-k>', act = '<Nop>',
  },
  {
    desc = 'Disable space to use as leader key',
    mode = 'n', key = '<Space>', act = '<Nop>',
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
    desc = '[b]ack',
    mode = 'n', key = '<leader>gb', act = "'b",
  },
  {
    desc = '[f]old',
    mode = 'n', key = '<leader>gnf', act = 'zj',
  },
  {
    desc = '[f]old',
    mode = 'n', key = '<leader>gpf', act = 'zk',
  },
  {
    desc = 'Navigate up through wrapped lines',
    mode = 'n', key = 'k', act = "v:count == 0 ? 'gk' : 'k'", expr = true,
  },
  {
    desc = 'Navigate down through wrapped lines',
    mode = 'n', key = 'j', act = "v:count == 0 ? 'gj' : 'j'", expr = true,
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
    desc = 'Increment progressively and keep selection',
    mode = 'v', key = 'g<C-a>', act = 'g<C-a>gv',
  },
  {
    desc = 'Decrement progressively and keep selection',
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
}
