-- [[ Configure Telescope ]]

local builtin = require('telescope.builtin')
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

local map = require('sgn.core.mapper').map

map({
  -- See `:help telescope.builtin`
  { mode = 'n', key = '<leader>to', act = builtin.oldfiles, desc = '[o]ld files' },
  { mode = 'n', key = '<leader>tb', act = builtin.buffers, desc = '[b]uffers' },
  { mode = 'n', key = '<leader>tr', act = builtin.lsp_references, desc = '[r]eferences' },
  { mode = 'n', key = '<leader>ts', act = builtin.lsp_document_symbols, desc = '[s]ymbols' },
  { mode = 'n', key = '<leader>tf', act = builtin.find_files, desc = '[f]ind files' },
  { mode = 'n', key = '<leader>th', act = builtin.help_tags, desc = '[h]elp tags' },
  { mode = 'n', key = '<leader>tg', act = builtin.live_grep, desc = '[g]rep files' },
  { mode = 'n', key = '<leader>td', act = builtin.diagnostics, desc = '[d]iagnostics' },
  { mode = 'n', key = '<leader>tm', act = builtin.man_pages, desc = '[m]anpages' },
  { mode = 'n', key = '<leader>tk', act = builtin.keymaps, desc = '[k]eybindings' },
  -- requires 'project.nvim'
  { mode = 'n', key = '<leader>wl', act = ':Telescope projects<CR>', desc = '[l]ist' },
})
