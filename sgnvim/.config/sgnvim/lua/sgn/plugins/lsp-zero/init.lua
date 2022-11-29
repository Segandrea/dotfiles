-- configurations for plugins involved with lsp-zero
local config = require('sgn.plugins.lsp-zero.config')

require('mason').setup(config.mason) -- Mason needs to be configured before lspzero

local lsp = require('lsp-zero')
lsp.preset('recommended') -- Using 'recommended' preset then adding preferences
lsp.set_preferences(config.zero_preferences)
lsp.nvim_workspace() -- Add lua lsp support for neovim config
-- attach lsp mappings to buffer
lsp.on_attach(require('sgn.plugins.lsp-zero.mappings'))
-- needs to be the last command after lsp configuration
lsp.setup()

-- Virtual text appearance
vim.diagnostic.config(config.diagnostic)
