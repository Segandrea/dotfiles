local telescope = require('telescope')
-- See `:help telescope` and `:help telescope.setup()`
telescope.setup(require('sgn.configs.telescope.config'))

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'projects')
--telescope.extensions.projects.projects({})

require('sgn.utils').map(require('sgn.configs.telescope.mappings'))
