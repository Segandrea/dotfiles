-- TODO: confiugre DAP (using lspzero or calling mason?)
-- NB: 'jbyuki/one-small-step-for-vimkind' may be needed for DAP 

-- Mason needs to be configured before lspzero
require('mason').setup({
  ui = {
    border = 'rounded',
    -- requires nerdfonts
    icons = {
      package_installed = '',
      package_pending = '',
      package_uninstalled = '',
    }
  }
})

-- Lspzero enable
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.set_preferences({
  set_lsp_keymaps = false, -- modified
  manage_nvim_cmp = false, -- modified
  sign_icons = {
    -- requires nerd fonts, matches trouble.nvim
    error = '',
    warn = '',
    hint = '',
    info = '',
  }
})

-- support for lua config
lsp.nvim_workspace()

-- [[ Mappings ]]
-- lsp mappings
lsp.on_attach(function(_, bufnr) -- first argument is "client", I don't need it
  local map = vim.keymap.set
  local options = function(description)
    return { buffer = bufnr, noremap = true, desc = description }
  end

  -- Diagnostic keymaps
  map('n', '<leader>gnp', vim.diagnostic.goto_next, options('[d]iagnostics'))
  map('n', '<leader>gpp', vim.diagnostic.goto_prev, options('[d]iagnostics'))
  map('n', '<leader>ls', vim.diagnostic.open_float, options('[s]how diagnostics'))
  -- lsp keymaps
  map('n', '<leader>lr', vim.lsp.buf.rename, options('[r]ename'))
  map('n', '<leader>lc', vim.lsp.buf.code_action, options('[c]ode action'))
  map('n', '<leader>gd', vim.lsp.buf.definition, options('[d]efinition'))
  map('n', '<leader>gi', vim.lsp.buf.implementation, options('[i]mplementation'))
  map('n', '<leader>gD', vim.lsp.buf.declaration, options('[D]eclaration'))
  map('n', '<leader>gt', vim.lsp.buf.type_definition, options('[t]ype definition'))
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, options('[a]dd Folder'))
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, options('[r]emove Folder'))
  -- See `:help K` for why this keymap
  map('n', 'K', vim.lsp.buf.hover, options('Hover Documentation'))
  map('n', '<C-k>', vim.lsp.buf.signature_help, options('Signature Documentation'))
end)

-- needs to be the last command after lsp configuration
lsp.setup()

-- Show lsp message in virtual text
vim.diagnostic.config({
  virtual_text = { prefix = '' },
})
