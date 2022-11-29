--------------------------------------------------
-- [[ Settings that are unrelated to plugins ]] --
--------------------------------------------------

-- [[ Basic variables ]]
require('sgn.core.variables')

-- [[ Basic options ]]
require('sgn.core.options')

-- [[ Basic autocmds ]]
require('sgn.core.autocmd')

-- [[ Basic mappings ]]
require('sgn.core.keybinder').map(require('sgn.core.mappings'))
