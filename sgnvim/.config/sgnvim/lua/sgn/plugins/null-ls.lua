local nls = require('null-ls')

local diagnostics = nls.builtins.diagnostics
local formatting = nls.builtins.formatting
local code_actions = nls.builtins.code_actions
-- local hover = nls.builtins.hover
-- local completion = nls.builtins.completion

nls.setup({
  sources = {
    -- [[ Formatting ]]
    formatting.prettier, -- webdev + md, yml
    -- [[ Diagnostic ]]
    diagnostics.eslint, -- webdev
    diagnostics.markdownlint.with({
      extra_args = { '-c', vim.fn.expand("$XDG_CONFIG_HOME/markdownlint/.markdownlint.yaml") },
    }), -- markdown only
    -- TODO: maybe vale is better for markdown + tex
    -- [[ Code actions ]]
    code_actions.shellcheck, -- sh
    code_actions.eslint, -- webdev
  },
})
