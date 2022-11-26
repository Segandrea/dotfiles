local ok, _ = pcall(require, 'nvim-tree')
if not ok then
  print('Error mapping nvim-tree')
  return
end
require('sgn.core.keybinder').map({
  { mode = 'n', key = '<leader>ft', act = '<Cmd>NvimTreeToggle<CR>', desc = '[t]oggle' },
  { mode = 'n', key = '<leader>ff', act = '<Cmd>NvimTreeFocus<CR>', desc = '[f]ocus' },
  { mode = 'n', key = '<leader>fs', act = '<Cmd>NvimTreeFindFile<CR>', desc = '[s]earch' },
})
