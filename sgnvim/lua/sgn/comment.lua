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
local map = vim.keymap.set
local options = function(description)
  return { noremap = true, silent = true, desc = description }
end

-- toggle line comment in VISUAL mode (NB: NO NEED FOR NOW)
--map('x', '<leader>cl', '<Plug>(comment_toggle_linewise_visual)', options('[l]ine'))
-- toggle block comment in VISUAL mode
map('x', '<leader>cb', '<Plug>(comment_toggle_blockwise_visual)', options('[b]lock'))
