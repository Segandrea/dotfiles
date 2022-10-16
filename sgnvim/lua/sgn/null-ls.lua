local nls = require('null-ls')
nls.setup({
  sources = {
    -- js/ts
    nls.builtins.formatting.prettier,
    nls.builtins.diagnostics.eslint,
  },
})
