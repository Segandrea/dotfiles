require('twilight').setup()
require('zen-mode').setup(require('sgn.plugins.zen-mode.config'))
require('sgn.core.keybinder').map(require('sgn.plugins.zen-mode.mappings'))
