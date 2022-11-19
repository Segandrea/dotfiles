local cmp = require('cmp')
local luasnip = require('luasnip') -- required for some mappings
local lspkind = require('lspkind') -- nicer entries for cmp
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- sources can be setted for filetypes think about markdown
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'latex_symbols' },
    { name = 'neorg' },
    { name = 'buffer', keyword_length = 5 },
  },
  -- cmp and luasnip mappings
  mapping = {
    ['<C-n>'] = cmp.mapping.scroll_docs(4),
    ['<C-N>'] = cmp.mapping.scroll_docs(-4),
    ['<C-a>'] = cmp.mapping.abort(),
    -- confirm completion
    ['<C-Space>']  = cmp.mapping(function(fallback) if cmp.visible() then cmp.confirm() else fallback() end end, { 'i', 's' }),
    -- FIXME: C-CR not working: ['<C-CR>'] = cmp.mapping(function(fallback) if cmp.visible() then cmp.confirm() else fallback() end end, { 'i', 's' }),
    -- select completion from menu
    ['<C-j>'] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_next_item() elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump() else fallback() end end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_prev_item() elseif luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end end, { 'i', 's' }),
    -- jump between luasnip snippet placeholders
    ['<Tab>']   = cmp.mapping(function(fallback) if luasnip.jumpable(1) then luasnip.jump(1) else fallback() end end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback) if luasnip.jumpable(-1) then luasnip.jump(-1) else fallback() end end, { 'i', 's' }),
  },
  -- 'onsails/lspkind.nvim' configuration
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      ellipsis_char = '...',
      with_text = true,
      menu = {
        nvim_lua      = '[Api]',
        nvim_lsp      = '[Lsp]',
        luasnip       = '[Snip]',
        path          = '[Path]',
        buffer        = '[Buf]',
        latex_symbols = '[LaTeX]',
        tmux          = '[Tmux]',
      },
    }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})
