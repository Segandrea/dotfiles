require('cmp').setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = require('cmp').config.window.bordered(),
    documentation = require('cmp').config.window.bordered(),
  },
  mapping = require('cmp').mapping.preset.insert({
    ['<C-b>'] = require('cmp').mapping.scroll_docs(-4),
    ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
    ['<C-Space>'] = require('cmp').mapping.complete(),
    ['<C-e>'] = require('cmp').mapping.abort(),
    ['<CR>'] = require('cmp').mapping.confirm({ select = true }),
  }),
  sources = require('cmp').config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
})

require('cmp').setup.cmdline('/', {
  mapping = require('cmp').mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  }
})
