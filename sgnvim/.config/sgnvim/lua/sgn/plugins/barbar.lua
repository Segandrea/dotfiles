require('bufferline').setup({
  auto_hide = true,
  tabpages =false,
  exclude_ft = { 'markdown' },
  exclude_name = {},
})

-- [[ Mappings ]]
local map = require('sgn.core.mapper').map

map({
  { mode = 'n', key = '<leader>gpb', act = '<Cmd>BufferPrevious<CR>',     desc = '[b]uffer'       },
  { mode = 'n', key = '<leader>gnb', act = '<Cmd>BufferNext<CR>',         desc = '[b]uffer'       },
  { mode = 'n', key = '<leader>bM',  act = '<Cmd>BufferMovePrevious<CR>', desc = '[M]ove back'    },
  { mode = 'n', key = '<leader>bm',  act = '<Cmd>BufferMoveNext<CR>',     desc = '[m]ove forward' },
  { mode = 'n', key = '<leader>bp',  act = '<Cmd>BufferPin<CR>',          desc = '[p]in'          },
  { mode = 'n', key = '<leader>bq',  act = '<Cmd>BufferClose<CR>',        desc = '[q]uit'         },
})
