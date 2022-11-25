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

--[[ Mappings ]]
local map = require('sgn.core.mapper').map
map({
  -- go left
  { mode = { 'i', 'n', 'v' }, key = '<M-h>', act = require("tmux").move_left, desc = 'Go left' },
  { mode = { 'i', 'n', 'v' }, key = '<M-Left>', act = require("tmux").move_left, desc = 'Go left' },
  -- go above
  { mode = { 'i', 'n', 'v' }, key = '<M-k>', act = require("tmux").move_top, desc = 'Go above' },
  { mode = { 'i', 'n', 'v' }, key = '<M-Up>', act = require("tmux").move_top, desc = 'Go above' },
  -- go below
  { mode = { 'i', 'n', 'v' }, key = '<M-j>', act = require("tmux").move_bottom, desc = 'Go below' },
  { mode = { 'i', 'n', 'v' }, key = '<M-Down>', act = require("tmux").move_bottom, desc = 'Go below' },
  -- go right
  { mode = { 'i', 'n', 'v' }, key = '<M-l>', act = require("tmux").move_right, desc = 'Go right' },
  { mode = { 'i', 'n', 'v' }, key = '<M-Right>', act = require("tmux").move_right, desc = 'Go right' },
  -- resize left
  { mode = { 'i', 'n', 'v' }, key = '<M-S-h>', act = require("tmux").resize_left, desc = 'Resize left' },
  { mode = { 'i', 'n', 'v' }, key = '<M-S-Left>', act = require("tmux").resize_left, desc = 'Resize left' },
  -- resize top
  { mode = { 'i', 'n', 'v' }, key = '<M-S-k>', act = require("tmux").resize_top, desc = 'Resize top' },
  { mode = { 'i', 'n', 'v' }, key = '<M-S-Up>', act = require("tmux").resize_top, desc = 'Resize top' },
  -- resize bottom
  { mode = { 'i', 'n', 'v' }, key = '<M-S-j>', act = require("tmux").resize_bottom, desc = 'Resize bottom' },
  { mode = { 'i', 'n', 'v' }, key = '<M-S-Down>', act = require("tmux").resize_bottom, desc = 'Resize bottom' },
  -- resize right
  { mode = { 'i', 'n', 'v' }, key = '<M-S-l>', act = require("tmux").resize_right, desc = 'Resize right' },
  { mode = { 'i', 'n', 'v' }, key = '<M-S-Right>', act = require("tmux").resize_right, desc = 'Resize right' },
})
