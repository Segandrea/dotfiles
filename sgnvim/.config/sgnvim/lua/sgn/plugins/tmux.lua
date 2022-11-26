--[[----------------------- Tmux configuration ----------------------------]]--
--   Configuration of tmux.nvim to have a seamless navigation between
--   tmux splits and vim splits.
--[[-----------------------------------------------------------------------]]--

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
