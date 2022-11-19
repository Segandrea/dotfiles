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

local map = vim.keymap.set
local options = function(description)
  return { noremap = true, silent = true, desc = description }
end

-- go left
map('i', '<M-h>', require("tmux").move_left, options('Go left'))
map('n', '<M-h>', require("tmux").move_left, options('Go left'))
map('v', '<M-h>', require("tmux").move_left, options('Go left'))
map('i', '<M-Left>', require("tmux").move_left, options('Go left'))
map('n', '<M-Left>', require("tmux").move_left, options('Go left'))
map('v', '<M-Left>', require("tmux").move_left, options('Go left'))

-- go above
map('i', '<M-k>', require("tmux").move_top, options('Go above'))
map('n', '<M-k>', require("tmux").move_top, options('Go above'))
map('v', '<M-k>', require("tmux").move_top, options('Go above'))
map('i', '<M-Up>', require("tmux").move_top, options('Go above'))
map('n', '<M-Up>', require("tmux").move_top, options('Go above'))
map('v', '<M-Up>', require("tmux").move_top, options('Go above'))

-- go below
map('i', '<M-j>', require("tmux").move_bottom, options('Go below'))
map('n', '<M-j>', require("tmux").move_bottom, options('Go below'))
map('v', '<M-j>', require("tmux").move_bottom, options('Go below'))
map('i', '<M-Down>', require("tmux").move_bottom, options('Go below'))
map('n', '<M-Down>', require("tmux").move_bottom, options('Go below'))
map('v', '<M-Down>', require("tmux").move_bottom, options('Go below'))

-- go right
map('i', '<M-l>', require("tmux").move_right, options('Go right'))
map('n', '<M-l>', require("tmux").move_right, options('Go right'))
map('v', '<M-l>', require("tmux").move_right, options('Go right'))
map('i', '<M-Right>', require("tmux").move_right, options('Go right'))
map('n', '<M-Right>', require("tmux").move_right, options('Go right'))
map('v', '<M-Right>', require("tmux").move_right, options('Go right'))

-- resize left
map('i', '<M-S-h>', require("tmux").resize_left, options('Resize left'))
map('n', '<M-S-h>', require("tmux").resize_left, options('Resize left'))
map('v', '<M-S-h>', require("tmux").resize_left, options('Resize left'))
map('i', '<M-S-Left>', require("tmux").resize_left, options('Resize left'))
map('n', '<M-S-Left>', require("tmux").resize_left, options('Resize left'))
map('v', '<M-S-Left>', require("tmux").resize_left, options('Resize left'))

-- resize top
map('i', '<M-S-k>', require("tmux").resize_top, options('Resize top'))
map('n', '<M-S-k>', require("tmux").resize_top, options('Resize top'))
map('v', '<M-S-k>', require("tmux").resize_top, options('Resize top'))
map('i', '<M-S-Up>', require("tmux").resize_top, options('Resize top'))
map('n', '<M-S-Up>', require("tmux").resize_top, options('Resize top'))
map('v', '<M-S-Up>', require("tmux").resize_top, options('Resize top'))

-- resize bottom
map('i', '<M-S-j>', require("tmux").resize_bottom, options('Resize bottom'))
map('n', '<M-S-j>', require("tmux").resize_bottom, options('Resize bottom'))
map('v', '<M-S-j>', require("tmux").resize_bottom, options('Resize bottom'))
map('i', '<M-S-Down>', require("tmux").resize_bottom, options('Resize bottom'))
map('n', '<M-S-Down>', require("tmux").resize_bottom, options('Resize bottom'))
map('v', '<M-S-Down>', require("tmux").resize_bottom, options('Resize bottom'))

-- resize right
map('i', '<M-S-l>', require("tmux").resize_right, options('Resize right'))
map('n', '<M-S-l>', require("tmux").resize_right, options('Resize right'))
map('v', '<M-S-l>', require("tmux").resize_right, options('Resize right'))
map('i', '<M-S-Right>', require("tmux").resize_right, options('Resize right'))
map('n', '<M-S-Right>', require("tmux").resize_right, options('Resize right'))
map('v', '<M-S-Right>', require("tmux").resize_right, options('Resize right'))
