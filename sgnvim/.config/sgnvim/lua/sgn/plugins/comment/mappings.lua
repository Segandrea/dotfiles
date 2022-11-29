return {
  -- toggle line comment in VISUAL mode
  { mode = 'x', key = '<leader>cl', act = '<Plug>(comment_toggle_linewise_visual)',  desc = '[l]ine'  },
  -- toggle block comment in VISUAL mode
  { mode = 'x', key = '<leader>cb', act = '<Plug>(comment_toggle_blockwise_visual)', desc = '[b]lock' },
}
