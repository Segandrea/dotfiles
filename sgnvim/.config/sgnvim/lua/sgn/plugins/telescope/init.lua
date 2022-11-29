-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup(require('sgn.plugins.telescope.config'))

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'projects')

require('sgn.core.keybinder').map(require('sgn.plugins.telescope.mappings'))
