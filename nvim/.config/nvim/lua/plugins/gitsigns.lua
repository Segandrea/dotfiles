return {
  'lewis6991/gitsigns.nvim',
  commit = '81369ed',
  event = 'VimEnter',
  config = function()
    require('gitsigns').setup({
      on_attach = function(bufnr)
        require('utils.mapper').map(require('plugins.mappings.Gitsigns')(bufnr))
      end
    })
  end,
}
