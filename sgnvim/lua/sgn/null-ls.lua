local nls = require('null-ls')
nls.setup({
  sources = {
    -- js/ts/react/vue, html/css(&co.)
    nls.builtins.formatting.prettier, -- also markdown and yaml
    nls.builtins.diagnostics.eslint,
    -- markdown
    nls.builtins.diagnostics.markdownlint,
  },
})
