-- [[ Configure Telescope ]]
local actions = require('telescope.actions')

-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-p>'] = false,
        ['<C-n>'] = false,
        ['<C-j>'] = {
          actions.move_selection_next, type = 'action',
          opts = { nowait = true, silent = true },
        },
        ['<C-k>'] = {
          actions.move_selection_previous, type = 'action',
          opts = { nowait = true, silent = true },
        },
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'projects')
