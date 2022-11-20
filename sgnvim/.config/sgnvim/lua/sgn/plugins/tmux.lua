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
  { mode = 'i', key = '<M-h>', act = require("tmux").move_left, desc = 'Go left' },
  { mode = 'n', key = '<M-h>', act = require("tmux").move_left, desc = 'Go left' },
  { mode = 'v', key = '<M-h>', act = require("tmux").move_left, desc = 'Go left' },
  { mode = 'i', key = '<M-Left>', act = require("tmux").move_left, desc = 'Go left' },
  { mode = 'n', key = '<M-Left>', act = require("tmux").move_left, desc = 'Go left' },
  { mode = 'v', key = '<M-Left>', act = require("tmux").move_left, desc = 'Go left' },
  -- go above
  { mode = 'i', key = '<M-k>', act = require("tmux").move_top, desc = 'Go above' },
  { mode = 'n', key = '<M-k>', act = require("tmux").move_top, desc = 'Go above' },
  { mode = 'v', key = '<M-k>', act = require("tmux").move_top, desc = 'Go above' },
  { mode = 'i', key = '<M-Up>', act = require("tmux").move_top, desc = 'Go above' },
  { mode = 'n', key = '<M-Up>', act = require("tmux").move_top, desc = 'Go above' },
  { mode = 'v', key = '<M-Up>', act = require("tmux").move_top, desc = 'Go above' },
  -- go below
  { mode = 'i', key = '<M-j>', act = require("tmux").move_bottom, desc = 'Go below' },
  { mode = 'n', key = '<M-j>', act = require("tmux").move_bottom, desc = 'Go below' },
  { mode = 'v', key = '<M-j>', act = require("tmux").move_bottom, desc = 'Go below' },
  { mode = 'i', key = '<M-Down>', act = require("tmux").move_bottom, desc = 'Go below' },
  { mode = 'n', key = '<M-Down>', act = require("tmux").move_bottom, desc = 'Go below' },
  { mode = 'v', key = '<M-Down>', act = require("tmux").move_bottom, desc = 'Go below' },
  -- go right
  { mode = 'i', key = '<M-l>', act = require("tmux").move_right, desc = 'Go right' },
  { mode = 'n', key = '<M-l>', act = require("tmux").move_right, desc = 'Go right' },
  { mode = 'v', key = '<M-l>', act = require("tmux").move_right, desc = 'Go right' },
  { mode = 'i', key = '<M-Right>', act = require("tmux").move_right, desc = 'Go right' },
  { mode = 'n', key = '<M-Right>', act = require("tmux").move_right, desc = 'Go right' },
  { mode = 'v', key = '<M-Right>', act = require("tmux").move_right, desc = 'Go right' },
  -- resize left
  { mode = 'i', key = '<M-S-h>', act = require("tmux").resize_left, desc = 'Resize left' },
  { mode = 'n', key = '<M-S-h>', act = require("tmux").resize_left, desc = 'Resize left' },
  { mode = 'v', key = '<M-S-h>', act = require("tmux").resize_left, desc = 'Resize left' },
  { mode = 'i', key = '<M-S-Left>', act = require("tmux").resize_left, desc = 'Resize left' },
  { mode = 'n', key = '<M-S-Left>', act = require("tmux").resize_left, desc = 'Resize left' },
  { mode = 'v', key = '<M-S-Left>', act = require("tmux").resize_left, desc = 'Resize left' },
  -- resize top
  { mode = 'i', key = '<M-S-k>', act = require("tmux").resize_top, desc = 'Resize top' },
  { mode = 'n', key = '<M-S-k>', act = require("tmux").resize_top, desc = 'Resize top' },
  { mode = 'v', key = '<M-S-k>', act = require("tmux").resize_top, desc = 'Resize top' },
  { mode = 'i', key = '<M-S-Up>', act = require("tmux").resize_top, desc = 'Resize top' },
  { mode = 'n', key = '<M-S-Up>', act = require("tmux").resize_top, desc = 'Resize top' },
  { mode = 'v', key = '<M-S-Up>', act = require("tmux").resize_top, desc = 'Resize top' },
  -- resize bottom
  { mode = 'i', key = '<M-S-j>', act = require("tmux").resize_bottom, desc = 'Resize bottom' },
  { mode = 'n', key = '<M-S-j>', act = require("tmux").resize_bottom, desc = 'Resize bottom' },
  { mode = 'v', key = '<M-S-j>', act = require("tmux").resize_bottom, desc = 'Resize bottom' },
  { mode = 'i', key = '<M-S-Down>', act = require("tmux").resize_bottom, desc = 'Resize bottom' },
  { mode = 'n', key = '<M-S-Down>', act = require("tmux").resize_bottom, desc = 'Resize bottom' },
  { mode = 'v', key = '<M-S-Down>', act = require("tmux").resize_bottom, desc = 'Resize bottom' },
  -- resize right
  { mode = 'i', key = '<M-S-l>', act = require("tmux").resize_right, desc = 'Resize right' },
  { mode = 'n', key = '<M-S-l>', act = require("tmux").resize_right, desc = 'Resize right' },
  { mode = 'v', key = '<M-S-l>', act = require("tmux").resize_right, desc = 'Resize right' },
  { mode = 'i', key = '<M-S-Right>', act = require("tmux").resize_right, desc = 'Resize right' },
  { mode = 'n', key = '<M-S-Right>', act = require("tmux").resize_right, desc = 'Resize right' },
  { mode = 'v', key = '<M-S-Right>', act = require("tmux").resize_right, desc = 'Resize right' },
})
