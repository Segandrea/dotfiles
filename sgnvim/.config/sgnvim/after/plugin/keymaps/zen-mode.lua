local zen_ok, zen = pcall(require, 'zen-mode')
local twilight_ok, twilight = pcall(require, 'twilight')
if not zen_ok or not twilight_ok then
  print('Error mapping zen-mode/twilight')
  return
end

-- [[ Mappings ]]
require('sgn.core.keybinder').map({
  { mode = 'n', key = '<leader>zt', act = twilight.toggle, desc = '[t]wilight', },
  { mode = 'n', key = '<leader>zz', act = zen.toggle, desc = '[z]en mode', },
})
