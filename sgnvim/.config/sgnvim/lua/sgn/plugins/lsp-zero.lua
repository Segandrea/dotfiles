-- TODO: confiugre DAP (using lspzero or calling mason?)
-- INFO: 'jbyuki/one-small-step-for-vimkind' may be needed for DAP

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

local on_attach = function(_, bufnr) -- first argument is "client", I don't need it
  local map = require('sgn.core.mapper').map
  map({
    -- Diagnostic keymaps
    {
      desc = '[d]iagnostics',
      mode = 'n', key = '<leader>gnp', act = vim.diagnostic.goto_next, buffer = bufnr,
    },
    {
      desc = '[d]iagnostics',
      mode = 'n', key = '<leader>gpp', act = vim.diagnostic.goto_prev, buffer = bufnr,
    },
    {
      desc = '[s]how diagnostics',
      mode = 'n', key = '<leader>ls', act = vim.diagnostic.open_float, buffer = bufnr,
    },
    -- lsp keymaps
    {
      desc = '[r]ename',
      mode = 'n', key = '<leader>lr', act = vim.lsp.buf.rename, buffer = bufnr,
    },
    {
      desc = '[c]ode action',
      mode = 'n', key = '<leader>lc', act = vim.lsp.buf.code_action, buffer = bufnr,
    },
    {
      desc = '[d]efinition',
      mode = 'n', key = '<leader>gd', act = vim.lsp.buf.definition, buffer = bufnr,
    },
    {
      desc = '[i]mplementation',
      mode = 'n', key = '<leader>gi', act = vim.lsp.buf.implementation, buffer = bufnr,
    },
    {
      desc = '[D]eclaration',
      mode = 'n', key = '<leader>gD', act = vim.lsp.buf.declaration, buffer = bufnr,
    },
    {
      desc = '[t]ype definition',
      mode = 'n', key = '<leader>gt', act = vim.lsp.buf.type_definition, buffer = bufnr,
    },
    {
      desc = '[a]dd Folder',
      mode = 'n', key = '<leader>wa', act = vim.lsp.buf.add_workspace_folder, buffer = bufnr,
    },
    {
      desc = '[r]emove Folder',
      mode = 'n', key = '<leader>wr', act = vim.lsp.buf.remove_workspace_folder, buffer = bufnr,
    },
    {
      desc = '[f]ormat',
      mode = 'n', key = '<leader>lf', buffer = bufnr,
      act = function()
        vim.lsp.buf.format({ async = true })
      end,
    },
    { -- See `:help K` for why this keymap
      desc = 'Hover Documentation',
      mode = 'n', key = 'K', act = vim.lsp.buf.hover, buffer = bufnr,
    },
    {
      desc = 'Signature Documentation',
      mode = 'n', key = '<C-k>', act = vim.lsp.buf.signature_help, buffer = bufnr,
    },
  })
end

-- [[ Mappings ]]
-- lsp mappings
lsp.on_attach(on_attach)

-- needs to be the last command after lsp configuration
lsp.setup()

-- [[ Diagnostics virtual text ]]
-- Show lsp message in virtual text
vim.diagnostic.config({
  virtual_text = { prefix = '' },
})
