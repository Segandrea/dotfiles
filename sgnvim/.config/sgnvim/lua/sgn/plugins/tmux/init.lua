--[[----------------------- Tmux configuration ----------------------------]]--
--   Configuration of tmux.nvim to have a seamless navigation between
--   tmux splits and vim splits.
--[[-----------------------------------------------------------------------]]--

require('tmux').setup(require('sgn.plugins.tmux.config'))
require('sgn.core.keybinder').map(require('sgn.plugins.tmux.mappings'))
