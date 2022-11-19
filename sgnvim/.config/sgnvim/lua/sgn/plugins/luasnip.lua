local luasnip = require('luasnip')

luasnip.config.set_config({
  -- If out of a snippet, pressing <tab> won't go back in a placeholder
  history = true,

  -- Dynamically change some placeholders while typing somewhere else
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets
  enable_autosnippets = true,
})

-- to load vscode-like plugins (loads from friendly-snippets)
require('luasnip.loaders.from_vscode').lazy_load()
