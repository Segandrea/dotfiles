require('Comment').setup({
  toggler = {
    -- Line-comment toggle
    line = '<leader>cl',
    -- Block-comment toggle
    block = '<leader>cb', -- Not working
  },
  extra = {
    -- Add comment above
    above = '<leader>ck',
    -- Add comment below
    below = '<leader>cj',
    -- Add comment at eol
    eol = '<leader>ca',
  },
})

-- [[ Custom mapping for visual mode ]]
local map = require('sgn.core.mapper').map

map({
  -- toggle line comment in VISUAL mode
  { mode = 'x', key = '<leader>cl', act = '<Plug>(comment_toggle_linewise_visual)',  desc = '[l]ine'  },
  -- toggle block comment in VISUAL mode
  { mode = 'x', key = '<leader>cb', act = '<Plug>(comment_toggle_blockwise_visual)', desc = '[b]lock' },
})
