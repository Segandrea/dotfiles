local ok, _ = pcall(require, 'Comment')
if not ok then
  print('Error mapping Comment')
  return
end

-- INFO: Mappings for NORMAL mode are in the config file in
-- `sgnvim/lua/sgn/plugins/comment.lua`

-- Custom mapping for visual mode
require('sgn.core.keybinder').map({
  -- toggle line comment in VISUAL mode
  { mode = 'x', key = '<leader>cl', act = '<Plug>(comment_toggle_linewise_visual)',  desc = '[l]ine'  },
  -- toggle block comment in VISUAL mode
  { mode = 'x', key = '<leader>cb', act = '<Plug>(comment_toggle_blockwise_visual)', desc = '[b]lock' },
})
