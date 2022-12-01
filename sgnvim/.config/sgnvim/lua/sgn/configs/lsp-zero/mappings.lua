return function(_, bufnr) -- first argument is "client", I don't need it
  require('sgn.utils').map({
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
