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
lsp.on_attach(function(client, bufnr) -- FIXME: client should be used
  local map = vim.keymap.set
  local options = function(description)
    return { buffer = bufnr, noremap = true, desc = description }
  end

  -- Diagnostic keymaps
  map('n', '<leader>pd', vim.diagnostic.goto_prev,  options('Go to [p]rev [d]iagnostics'))
  map('n', '<leader>nd', vim.diagnostic.goto_next,  options('Go to [n]ext [d]iagnostics'))
  map('n', '<leader>fd', vim.diagnostic.open_float, options('Show [f]loating window with [d]iagnostics'))
  -- lsp keymaps
  map('n', '<leader>rn', vim.lsp.buf.rename, options('[R]e[n]ame'))
  map('n', '<leader>ca', vim.lsp.buf.code_action, options('[C]ode [A]ction'))
  map('n', 'gd', vim.lsp.buf.definition, options('[G]oto [D]efinition'))
  map('n', 'gi', vim.lsp.buf.implementation, options('[G]oto [I]mplementation'))
  map('n', 'gD', vim.lsp.buf.declaration, options('[G]oto [D]eclaration'))
  map('n', '<leader>D', vim.lsp.buf.type_definition, options('Type [D]efinition'))
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, options('[W]orkspace [A]dd Folder'))
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, options('[W]orkspace [R]emove Folder'))
  -- See `:help K` for why this keymap
  map('n', 'K', vim.lsp.buf.hover, options('Hover Documentation'))
  map('n', '<C-k>', vim.lsp.buf.signature_help, options('Signature Documentation'))
  -- keymaps using telescope
  map('n', 'gr', require('telescope.builtin').lsp_references, options('[G]et lsp [R]eferences'))
  map('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, options('[D]ocument [S]ymbols'))
  map('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, options('[W]orkspace [S]ymbols'))
  -- TODO: display this differently (?)
  map('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, options('[W]orkspace [L]ist Folders'))
end)

-- TODO: change keymaps!!
-- cmp mappings
local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- sources can be setted for filetypes think about markdown
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.scroll_docs(4),
    ['<C-N>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-a>'] = cmp.mapping.abort(),
    ['<C-CR>'] = function(fallback)
      if cmp.visible() then
        cmp.confirm()
      else
        fallback()
      end
    end,
    ['<C-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
})

-- needs to be the last command
lsp.setup()
