return {
  'gbprod/substitute.nvim',
  commit = '17ffaeb',
  config = function()
    require('substitute').setup()
    require('utils.mapper').map(require('plugins.mappings.Substitute'))
  end
}
