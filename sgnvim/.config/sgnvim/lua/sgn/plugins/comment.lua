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
