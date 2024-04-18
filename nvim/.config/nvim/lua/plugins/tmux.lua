return {
  'aserowy/tmux.nvim',
  commit = '63e9c5e',
  config = function()
    require('tmux').setup({
      -- overwrite default configuration
      -- here, e.g. to enable default bindings
      copy_sync = {
        -- enables copy sync and overwrites all register actions to
        -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
        enable = false,
      },
      navigation = {
        -- enables default keybindings (C-hjkl) for normal mode
        enable_default_keybindings = false,
        cycle_navigation = false,
      },
      resize = {
        -- enables default keybindings (A-hjkl) for normal mode
        enable_default_keybindings = false,
      }
    })
    require('utils.mapper').map(require('plugins.mappings.Tmux'))
  end,
}
