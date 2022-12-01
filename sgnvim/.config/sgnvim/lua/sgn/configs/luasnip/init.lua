require('luasnip').config.set_config(require('sgn.configs.luasnip.config'))

-- to load vscode-like plugins (loads from friendly-snippets)
require('luasnip.loaders.from_vscode').lazy_load()
