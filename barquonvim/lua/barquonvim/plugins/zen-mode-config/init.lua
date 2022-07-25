local zen = require('zen-mode')
zen.setup({
  window = {
    width = 90,
    options = {
      signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      relativenumber = false, -- disable relative numbers
      cursorline = false, -- disable cursorline
      cursorcolumn = false, -- disable cursor column
      foldcolumn = "0", -- disable fold column
      list = false, -- disable whitespace characters
    },
  },
  plugins = {
    tmux = { enabled = true },
  },
})

require('barquonvim.plugins.zen-mode-config.mappings')
