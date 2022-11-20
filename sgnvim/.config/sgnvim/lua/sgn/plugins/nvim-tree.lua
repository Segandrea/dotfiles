-- diasble netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  reload_on_bufenter = true,
  view = {
    adaptive_size = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
    icons = {
      glyphs = {
        git = {
          untracked = '',
          unstaged = '',
          staged = '',
          unmerged = '',
          renamed = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 50,
    icons = {
      hint = '',
      info = '',
      warning = "",
      error = '',
    },
  },
})

-- [[ Mappings ]]
local map = require('sgn.core.mapper').map
map({
  { mode = 'n', key = '<leader>ft', act = '<Cmd>NvimTreeToggle<CR>', desc = '[t]oggle' },
  { mode = 'n', key = '<leader>ff', act = '<Cmd>NvimTreeFocus<CR>', desc = '[f]ocus' },
  { mode = 'n', key = '<leader>fs', act = '<Cmd>NvimTreeFindFile<CR>', desc = '[s]earch' },
})
