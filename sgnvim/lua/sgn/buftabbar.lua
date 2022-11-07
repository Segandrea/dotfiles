require('bufferline').setup({
  auto_hide = true,
  tabpages =false,
  exclude_ft = { 'markdown' },
  exclude_name = {},
})

-- [[ Mappings ]]
local map = vim.keymap.set
local options = function(description)
  return { noremap = true, silent = true, desc = description }
end

map('n', '<leader>gpb', '<Cmd>BufferPrevious<CR>', options('[b]uffer'))
map('n', '<leader>gnb', '<Cmd>BufferNext<CR>', options('[b]uffer'))
map('n', '<leader>bM', '<Cmd>BufferMovePrevious<CR>', options('[M]ove back'))
map('n', '<leader>bm', '<Cmd>BufferMoveNext<CR>', options('[m]ove forward'))
map('n', '<leader>bp', '<Cmd>BufferPin<CR>', options('[p]in'))
map('n', '<leader>bq', '<Cmd>BufferClose<CR>', options('[q]uit'))
