--[[----------------------- Tmux configuration ----------------------------]]--
--   Configuration of tmux.nvim to have a seamless navigation between
--   tmux splits and vim splits.
--[[-----------------------------------------------------------------------]]--

require('tmux').setup(require('sgn.configs.tmux.config'))
require('sgn.utils').map(require('sgn.configs.tmux.mappings'))
