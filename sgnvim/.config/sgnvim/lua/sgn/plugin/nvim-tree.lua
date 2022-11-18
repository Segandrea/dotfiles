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
local map = vim.keymap.set
local options = function(description)
  return { noremap = true, silent = true, desc = description }
end

map('n', '<leader>ft', '<Cmd>NvimTreeToggle<CR>', options('[t]oggle'))
map('n', '<leader>ff', '<Cmd>NvimTreeFocus<CR>', options('[f]ocus'))
map('n', '<leader>fs', '<Cmd>NvimTreeFindFile<CR>', options('[s]earch'))
