return {
  'numToStr/Comment.nvim',
  commit = '0236521',
  opts = {
    -- LHS of toggle mappings in NORMAL mode
    toggler = {
      -- Line-comment toggle keymap
      line = '<leader>//',
      -- Block-comment toggle keymap
      block = '<leader>/bb',
    },
    -- LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
      -- Line-comment keymap
      line = '<leader>/',
      -- Block-comment keymap
      block = '<leader>/b',
    },
    -- LHS of extra mappings
    extra = {
      -- Add comment on the line above
      above = '<leader>/O',
      -- Add comment on the line below
      below = '<leader>/o',
      -- Add comment at the end of line
      eol = '<leader>/A',
    },
    -- Enable keybindings
    -- NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
      ---Operator-pending mapping; `<leader>//` `<leader>/bb` `<leader>/[count]{motion}` `<leader>/b[count]{motion}`
      basic = true,
      ---Extra mapping; `<leader>/O`, `<leader>/o`, `<leader>/A`
      extra = true,
    },
  },
  lazy = false,
}
