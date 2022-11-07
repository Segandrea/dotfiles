local nls = require('null-ls')
nls.setup({
  sources = {
    -- [[ Formatting ]]
    nls.builtins.formatting.prettier, -- webdev + md, yml
    -- [[ Diagnostic ]]
    nls.builtins.diagnostics.eslint, -- webdev
    -- TODO: maybe vale is better for markdown + tex
    nls.builtins.diagnostics.markdownlint, -- markdown only
    -- [[ Code actions ]]
    nls.builtins.code_actions.shellcheck, -- sh
    nls.builtins.code_actions.eslint, -- webdev
  },
})
