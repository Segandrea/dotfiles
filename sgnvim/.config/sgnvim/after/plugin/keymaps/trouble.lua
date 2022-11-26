local ok, _ = pcall(require, 'trouble')
if not ok then
  print('Error mapping trouble')
  return
end
require('sgn.core.keybinder').map({
  { mode = 'n', key = '<leader>wd', act = ':TroubleToggle workspace_diagnostics<CR>', desc = '[d]iagnostics', },
  { mode = 'n', key = '<leader>?',  act = ':TroubleToggle document_diagnostics<CR>', desc = 'trouble[?]', },
})
