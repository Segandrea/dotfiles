-- Core mappings for the configuration
-- Will probably be overwritten by plugins
local mappings = {
  -- Insert Mode mappings
  {
    mode = 'i',
    key = '<Tab>',
    act = '<Right>',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Go right instead of tab',
    },
  },
  {
    mode = 'i',
    key = '<S-Tab>',
    act = '<Nop>',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Disable shift-tab',
    },
  },
  {
    mode = 'i',
    key = '<C-j>',
    act = '<Nop>',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Disable ctrl-j',
    },
  },
  {
    mode = 'i',
    key = '<C-k>',
    act = '<Nop>',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Disable ctrl-k',
    },
  },
  -- Normal Mode mappings
  {
    mode = 'n',
    key = '<Space>',
    act = '<Nop>',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Disable space to use as leader key',
    },
  },
  {
    mode = 'n',
    key = 'n',
    act = ':set<space>hlsearch<cr>nzzzv',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Center and highlight next search',
    },
  },
  {
    mode = 'n',
    key = 'N',
    act = ':set<space>hlsearch<cr>Nzzzv',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Center and highlight prev search',
    },
  },
  {
    mode = 'n',
    key = '>',
    act = '>>',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Indent to right',
    },
  },
  {
    mode = 'n',
    key = '<',
    act = '<<',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Indent to left',
    },
  },
  {
    mode = 'n',
    key = '<Esc>',
    act = ':set<space>nohlsearch<cr><esc>',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Deactivate highlight',
    },
  },
  {
    mode = 'n',
    key = '/',
    act = ':set<space>hlsearch<cr>mb/',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Mark starting point and highlight next searched word',
    },
  },
  {
    mode = 'n',
    key = '*',
    act = ':set<space>hlsearch<cr>mb*',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Mark starting point and highlight next match',
    },
  },
  {
    mode = 'n',
    key = '?',
    act = ':set<space>hlsearch<cr>mb?',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Mark starting point and highlight prev searched word',
    },
  },
  {
    mode = 'n',
    key = '#',
    act = ':set<space>hlsearch<cr>mb#',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Mark starting point and highlight prev match',
    },
  },
  {
    mode = 'n',
    key = '<leader>gb',
    act = "'b",
    opt = {
      noremap = true,
      silent = true,
      desc = '[b]ack',
    },
  },
  {
    mode = 'n',
    key = '<leader>gnf',
    act = 'zj',
    opt = {
      noremap = true,
      silent = true,
      desc = '[f]old',
    },
  },
  {
    mode = 'n',
    key = '<leader>gpf',
    act = 'zk',
    opt = {
      noremap = true,
      silent = true,
      desc = '[f]old',
    },
  },
  {
    mode = 'n',
    key = 'k',
    act = "v:count == 0 ? 'gk' : 'k'",
    opt = {
      noremap = true,
      silent = true,
      expr = true,
      desc = 'Navigate up through wrapped lines',
    },
  },
  {
    mode = 'n',
    key = 'j',
    act = "v:count == 0 ? 'gj' : 'j'",
    opt = {
      noremap = true,
      silent = true,
      expr = true,
      desc = 'Navigate down through wrapped lines',
    },
  },
  -- Visual Mode mappings
  {
    mode = 'v',
    key = 'K',
    act = ":m<space>'<-2<cr>gv=gv",
    opt = {
      noremap = true,
      silent = true,
      desc = 'Move current line above',
    },
  },
  {
    mode = 'v',
    key = 'J',
    act = ":m<space>'>+1<cr>gv=gv",
    opt = {
      noremap = true,
      silent = true,
      desc = 'Move current line below',
    },
  },
  {
    mode = 'v',
    key = '<C-a>',
    act = '<C-a>gv',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Increment and keep selection',
    },
  },
  {
    mode = 'v',
    key = '<C-x>',
    act = '<C-x>gv',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Decrement and keep selection',
    },
  },
  {
    mode = 'v',
    key = 'g<C-a>',
    act = 'g<C-a>gv',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Increment progressively and keep selection',
    },
  },
  {
    mode = 'v',
    key = 'g<C-x>',
    act = 'g<C-x>gv',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Decrement progressively and keep selection',
    },
  },
  {
    mode = 'v',
    key = '>',
    act = '>gv',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Indent right and keep selection',
    },
  },
  {
    mode = 'v',
    key = '<',
    act = '<gv',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Indent left and keep selection',
    },
  },
  {
    mode = 'v',
    key = '<Space>',
    act = '<Nop>',
    opt = {
      noremap = true,
      silent = true,
      desc = 'Disable space',
    },
  },
}

local map = vim.keymap.set
for _, binding in ipairs(mappings) do
  map(binding.mode, binding.key, binding.act, binding.opt)
end
