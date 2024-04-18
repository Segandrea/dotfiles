-- This function is a workaround to get the bufnr correctly
-- But this makes this file uncompatible with the solution of iterating
-- through the files inside the `mapping/` directory to map them
return function(bufnr)
  return {
    -- Diagnostic keymaps
    { -- Go next diagnostic
      desc = '[d]iagnostics',
      mode = 'n',
      key = 'gnd',
      act = vim.diagnostic.goto_next,
      buffer = bufnr,
    },
    { -- Go prev diagnostic
      desc = '[d]iagnostics',
      mode = 'n',
      key = 'gpd',
      act = vim.diagnostic.goto_prev,
      buffer = bufnr,
    },
    { -- Show diagnostics in floating window
      desc = '[d]iagnostics',
      mode = 'n',
      key = '<leader>ld',
      act = vim.diagnostic.open_float,
      buffer = bufnr,
    },
    -- lsp keymaps
    { -- Rename
      desc = '[r]ename',
      mode = 'n',
      key = '<leader>lr',
      act = vim.lsp.buf.rename,
      buffer = bufnr,
    },
    { -- Code action
      desc = '[c]ode action',
      mode = 'n',
      key = '<leader>lc',
      act = vim.lsp.buf.code_action,
      buffer = bufnr,
    },
    { -- Go definition
      desc = '[d]efinition',
      mode = 'n',
      key = 'gd',
      act = vim.lsp.buf.definition,
      buffer = bufnr,
    },
    { -- List implementations
      desc = '[i]mplementation',
      mode = 'n',
      key = 'gi',
      act = vim.lsp.buf.implementation,
      buffer = bufnr,
    },
    { -- Go declaration
      desc = '[D]eclaration',
      mode = 'n',
      key = 'gD',
      act = vim.lsp.buf.declaration,
      buffer = bufnr,
    },
    { -- Go type definition
      desc = '[t]ype definition',
      mode = 'n',
      key = 'gt',
      act = vim.lsp.buf.type_definition,
      buffer = bufnr,
    },
    { -- Format
      desc = '[f]ormat',
      mode = 'n',
      key = '<leader>lf',
      buffer = bufnr,
      act = function()
        vim.lsp.buf.format({ async = true })
      end,
    },
    { -- See `:help K` for why this keymap (show floating documentation)
      desc = 'Hover Documentation',
      mode = 'n',
      key = 'K',
      act = vim.lsp.buf.hover,
      buffer = bufnr,
    },
    { -- Show signature of function
      desc = 'Signature Documentation',
      mode = 'n',
      key = '<C-k>',
      act = vim.lsp.buf.signature_help,
      buffer = bufnr,
    },
  }
end
