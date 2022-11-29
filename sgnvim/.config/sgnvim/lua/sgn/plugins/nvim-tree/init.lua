require('sgn.plugins.nvim-tree.variables')
require('nvim-tree').setup(require('sgn.plugins.nvim-tree.config'))
require('sgn.core.keybinder').map(require('sgn.plugins.nvim-tree.mappings'))
