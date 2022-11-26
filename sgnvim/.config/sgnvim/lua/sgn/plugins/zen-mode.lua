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
