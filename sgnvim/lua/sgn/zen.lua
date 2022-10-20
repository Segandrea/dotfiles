require('twilight').setup()
require('zen-mode').setup({
  window = {
    backdrop = 1,
    width = .85,
    options = {
      signcolumn = 'no',
      number = false,
      relativenumber = false,
      cursorline = false,
      cursorcolumn = false,
      list = false,
    },
  },
  plugins = {
    twilight = { enabled = false, },
    tmux = { enabled = false, },
  },
})

local map = vim.keymap.set
local options = function(description)
  return { noremap = true, silent = true, desc = description }
end

map('n', '<leader>zt', require('twilight').toggle, options('[z]en [t]wilight to focus'))
map('n', '<leader>zz', require('zen-mode').toggle, options('[z]en mode full [z]en'))
