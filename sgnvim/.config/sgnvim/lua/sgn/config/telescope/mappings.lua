local builtin = require('telescope.builtin')
return {
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
}
