local actions = require('telescope.actions')
return {
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
