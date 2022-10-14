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

local map = vim.keymap.set
local options = function(description)
  return { noremap = true, silent = true, desc = description }
end

-- See `:help telescope.builtin`
map('n', '<leader>to', builtin.oldfiles, options('[t]elescope show [o]ld files'))
map('n', '<leader>tb', builtin.buffers, options('[t]elescope show open [b]uffers'))
map('n', '<leader>tr', builtin.lsp_references, options('[t]elescope show [r]eferences'))
map('n', '<leader>ts', builtin.lsp_document_symbols, options('[t]elescope show document [s]ymbols'))
map('n', '<leader>tf', builtin.find_files, options('[t]elescope find [f]iles'))
map('n', '<leader>th', builtin.help_tags, options('[t]elescope search vim [h]elp'))
map('n', '<leader>tg', builtin.live_grep, options('[t]elescope [g]rep files'))
map('n', '<leader>td', builtin.diagnostics, options('[t]elescope show [d]iagnostics'))
map('n', '<leader>tm', builtin.man_pages, options('[t]elescope show [m]anpages'))
map('n', '<leader>tk', builtin.keymaps, options('[t]elescope show [k]eybindings'))

-- requires 'project.nvim'
map('n', '<leader>wl', ':Telescope projects<CR>', options('telescope show [w]orkspace [l]ist'))
