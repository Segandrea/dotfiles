-- TODO: confiugre DAP (using lspzero or calling mason?)
-- NB: 'jbyuki/one-small-step-for-vimkind' may be needed for DAP 
-- Lspzero enable
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.set_preferences({
  set_lsp_keymaps = false, -- modified
  manage_nvim_cmp = false, -- modified
  sign_icons = {
    -- requires nerd fonts
    error = '',
    warn = '',
    hint = '',
    info = ''
  }
})

-- support for lua config
lsp.nvim_workspace()

-- [[ Mappings ]]
-- TODO: change keymaps!!
-- lsp mappings
lsp.on_attach(function(_, bufnr) -- first argument is "client", I don't need it
  local map = vim.keymap.set
  local options = function(description)
    return { buffer = bufnr, noremap = true, desc = description }
  end

  -- Diagnostic keymaps
  map('n', '<leader>gnd', vim.diagnostic.goto_next, options('[g]o to [n]ext [d]iagnostics'))
  map('n', '<leader>gpd', vim.diagnostic.goto_prev, options('[g]o to [p]rev [d]iagnostics'))
  map('n', '<leader>ld', vim.diagnostic.open_float, options('[l]sp show with [d]iagnostics'))
  -- lsp keymaps
  map('n', '<leader>lr', vim.lsp.buf.rename, options('[l]sp [r]ename'))
  map('n', '<leader>lc', vim.lsp.buf.code_action, options('[l]sp [c]ode action'))
  map('n', '<leader>gd', vim.lsp.buf.definition, options('[g]o to [d]efinition'))
  map('n', '<leader>gi', vim.lsp.buf.implementation, options('[g]o to [i]mplementation'))
  map('n', '<leader>gD', vim.lsp.buf.declaration, options('[g]o to [D]eclaration'))
  map('n', '<leader>gt', vim.lsp.buf.type_definition, options('[g]o to [t]ype definition'))
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, options('[w]orkspace [a]dd Folder'))
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, options('[w]orkspace [r]emove Folder'))
  -- See `:help K` for why this keymap
  map('n', 'K', vim.lsp.buf.hover, options('Hover Documentation'))
  map('n', '<C-k>', vim.lsp.buf.signature_help, options('Signature Documentation'))
end)

-- needs to be the last command
lsp.setup()
