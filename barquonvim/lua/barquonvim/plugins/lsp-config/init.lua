local lsp = require('lsp-zero')

-- this is like lsp.preset('recommended') but without keybindings
lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '',
    warn = '',
    hint = '',
    info = ''
  }
})

lsp.nvim_workspace()
-- to configure specific lsps use `require('lsp-zero').config()` it takes
-- the same input of nvim-lspconfig. Also, `.setup()` should be the last call.
lsp.setup()

-- which-key mappings
require('barquonvim.plugins.lsp-config.mappings')

-- [[ lsp configurations ]]
-- lua
require('barquonvim.plugins.lsp-config.sumneko-lua')
