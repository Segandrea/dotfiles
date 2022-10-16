local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
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
  -- cmp mappings
  mapping = {
    ['<C-n>'] = cmp.mapping.scroll_docs(4),
    ['<C-N>'] = cmp.mapping.scroll_docs(-4),
    ['<C-a>'] = cmp.mapping.abort(),
    ['<C-Space>'] = function(fallback)
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
  -- 'onsails/lspkind.nvim' configuration
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      ellipsis_char = '...',
    }),
  },
})
