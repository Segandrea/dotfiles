--[[ Defaults' configuration ]]
require('tmux').setup {
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
}

--[[ Mappings ]]

local map = vim.keymap.set
local options = { noremap = true, silent = true }

-- go left
map('i', '<M-h>', ':lua require("tmux").move_left()<cr>', options)
map('n', '<M-h>', ':lua require("tmux").move_left()<cr>', options)
map('v', '<M-h>', ':lua require("tmux").move_left()<cr>', options)
map('i', '<M-Left>', ':lua require("tmux").move_left()<cr>', options)
map('n', '<M-Left>', ':lua require("tmux").move_left()<cr>', options)
map('v', '<M-Left>', ':lua require("tmux").move_left()<cr>', options)

-- go top
map('i', '<M-k>', ':lua require("tmux").move_top()<cr>', options)
map('n', '<M-k>', ':lua require("tmux").move_top()<cr>', options)
map('v', '<M-k>', ':lua require("tmux").move_top()<cr>', options)
map('i', '<M-Up>', ':lua require("tmux").move_top()<cr>', options)
map('n', '<M-Up>', ':lua require("tmux").move_top()<cr>', options)
map('v', '<M-Up>', ':lua require("tmux").move_top()<cr>', options)

-- go bottom
map('i', '<M-j>', ':lua require("tmux").move_bottom()<cr>', options)
map('n', '<M-j>', ':lua require("tmux").move_bottom()<cr>', options)
map('v', '<M-j>', ':lua require("tmux").move_bottom()<cr>', options)
map('i', '<M-Down>', ':lua require("tmux").move_bottom()<cr>', options)
map('n', '<M-Down>', ':lua require("tmux").move_bottom()<cr>', options)
map('v', '<M-Down>', ':lua require("tmux").move_bottom()<cr>', options)

-- go right
map('i', '<M-l>', ':lua require("tmux").move_right()<cr>', options)
map('n', '<M-l>', ':lua require("tmux").move_right()<cr>', options)
map('v', '<M-l>', ':lua require("tmux").move_right()<cr>', options)
map('i', '<M-Right>', ':lua require("tmux").move_right()<cr>', options)
map('n', '<M-Right>', ':lua require("tmux").move_right()<cr>', options)
map('v', '<M-Right>', ':lua require("tmux").move_right()<cr>', options)

-- resize left
map('i', '<M-S-H>', ':lua require("tmux").resize_left()<cr>', options)
map('n', '<M-S-H>', ':lua require("tmux").resize_left()<cr>', options)
map('v', '<M-S-H>', ':lua require("tmux").resize_left()<cr>', options)
map('i', '<M-S-Left>', ':lua require("tmux").resize_left()<cr>', options)
map('n', '<M-S-Left>', ':lua require("tmux").resize_left()<cr>', options)
map('v', '<M-S-Left>', ':lua require("tmux").resize_left()<cr>', options)

-- resize top
map('i', '<M-S-k>', ':lua require("tmux").resize_top()<cr>', options)
map('n', '<M-S-k>', ':lua require("tmux").resize_top()<cr>', options)
map('v', '<M-S-k>', ':lua require("tmux").resize_top()<cr>', options)
map('i', '<M-S-Up>', ':lua require("tmux").resize_top()<cr>', options)
map('n', '<M-S-Up>', ':lua require("tmux").resize_top()<cr>', options)
map('v', '<M-S-Up>', ':lua require("tmux").resize_top()<cr>', options)

-- resize bottom
map('i', '<M-S-j>', ':lua require("tmux").resize_bottom()<cr>', options)
map('n', '<M-S-j>', ':lua require("tmux").resize_bottom()<cr>', options)
map('v', '<M-S-j>', ':lua require("tmux").resize_bottom()<cr>', options)
map('i', '<M-S-Down>', ':lua require("tmux").resize_bottom()<cr>', options)
map('n', '<M-S-Down>', ':lua require("tmux").resize_bottom()<cr>', options)
map('v', '<M-S-Down>', ':lua require("tmux").resize_bottom()<cr>', options)

-- resize right
map('i', '<M-S-l>', ':lua require("tmux").resize_right()<cr>', options)
map('n', '<M-S-l>', ':lua require("tmux").resize_right()<cr>', options)
map('v', '<M-S-l>', ':lua require("tmux").resize_right()<cr>', options)
map('i', '<M-S-Right>', ':lua require("tmux").resize_right()<cr>', options)
map('n', '<M-S-Right>', ':lua require("tmux").resize_right()<cr>', options)
map('v', '<M-S-Right>', ':lua require("tmux").resize_right()<cr>', options)
