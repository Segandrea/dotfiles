local ok, tmux = pcall(require, 'tmux')
if not ok then
  print('Error mapping tmux')
  return
end

require('sgn.core.keybinder').map({
  -- go left
  { mode = { 'i', 'n', 'v' }, key = '<M-h>', act = tmux.move_left, desc = 'Go left' },
  { mode = { 'i', 'n', 'v' }, key = '<M-Left>', act = tmux.move_left, desc = 'Go left' },
  -- go above
  { mode = { 'i', 'n', 'v' }, key = '<M-k>', act = tmux.move_top, desc = 'Go above' },
  { mode = { 'i', 'n', 'v' }, key = '<M-Up>', act = tmux.move_top, desc = 'Go above' },
  -- go below
  { mode = { 'i', 'n', 'v' }, key = '<M-j>', act = tmux.move_bottom, desc = 'Go below' },
  { mode = { 'i', 'n', 'v' }, key = '<M-Down>', act = tmux.move_bottom, desc = 'Go below' },
  -- go right
  { mode = { 'i', 'n', 'v' }, key = '<M-l>', act = tmux.move_right, desc = 'Go right' },
  { mode = { 'i', 'n', 'v' }, key = '<M-Right>', act = tmux.move_right, desc = 'Go right' },
  -- resize left
  { mode = { 'i', 'n', 'v' }, key = '<M-S-h>', act = tmux.resize_left, desc = 'Resize left' },
  { mode = { 'i', 'n', 'v' }, key = '<M-S-Left>', act = tmux.resize_left, desc = 'Resize left' },
  -- resize top
  { mode = { 'i', 'n', 'v' }, key = '<M-S-k>', act = tmux.resize_top, desc = 'Resize top' },
  { mode = { 'i', 'n', 'v' }, key = '<M-S-Up>', act = tmux.resize_top, desc = 'Resize top' },
  -- resize bottom
  { mode = { 'i', 'n', 'v' }, key = '<M-S-j>', act = tmux.resize_bottom, desc = 'Resize bottom' },
  { mode = { 'i', 'n', 'v' }, key = '<M-S-Down>', act = tmux.resize_bottom, desc = 'Resize bottom' },
  -- resize right
  { mode = { 'i', 'n', 'v' }, key = '<M-S-l>', act = tmux.resize_right, desc = 'Resize right' },
  { mode = { 'i', 'n', 'v' }, key = '<M-S-Right>', act = tmux.resize_right, desc = 'Resize right' },
  -- quit tmux pane without problem
  { mode = { 'n', 'n', 'v' }, key = '<M-q>', act = ':wa<CR>:!tmux kill-pane<CR>', desc = 'Quit this split'}
})
