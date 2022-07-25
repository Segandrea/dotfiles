-- To check for conflicting keymaps do `:checkhealth which_key`

-- Ui configuration
local conf = {
  window = {
    border = "double",
    position = "bottom",
    margin = { 0, 0, 0, 0 },
    padding = { 1, 1, 1, 1 },
  },
}

-- [[ Setup which-key and bind mappings ]]
local whichkeys = require("which-key")
whichkeys.setup(conf)

-- [[ Disable some operators ]]
-- These are needed to avoid showing which key when pressing basic operations
local presets = require('which-key.plugins.presets')
presets.operators['c'] = nil -- no hint changing  text
presets.operators['d'] = nil -- no hint deleting  text
presets.operators['v'] = nil -- no hint selecting text
presets.operators['y'] = nil -- no hint yanking   text
