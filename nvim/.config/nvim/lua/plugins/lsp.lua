return {
  { -- Lsp-zero.nvim
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    commit = '74441a6',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  { -- Mason.nvim
    'williamboman/mason.nvim',
    commit = '751b1fc',
    cmd = {
      'Mason',
      'MasonInstall',
      'MasonLog',
      'MasonUninstall',
      'MasonUninstallAll',
      'MasonUpdate',
    },
    build = ':MasonUpdate',
    config = true,
  },

  -- Autocompletion
  { -- Nvim-cmp
    'hrsh7th/nvim-cmp',
    commit = 'ce16de5',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        commit = 'be7be2c',
        dependencies = { 'rafamadriz/friendly-snippets' },
        keys = function()
          -- Disable default tab keybinding in LuaSnip
          return {}
        end,
      },
      {
        'saadparwaiz1/cmp_luasnip',
        commit = '05a9ab2',
      },
      {
        'windwp/nvim-autopairs',
        commit = '4f41e59',
      },
      {
        'hrsh7th/cmp-buffer',
        commit = '3022dbc',
      },
      {
        'hrsh7th/cmp-cmdline',
        commit = 'd250c63',
      },
      {
        'hrsh7th/cmp-path',
        commit = '91ff86c',
      },
    },
    config = function()
      -- load friendly-snippets inside luasnip
      require('luasnip.loaders.from_vscode').lazy_load()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')

      -- Add completion for searching
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Add completion for command mode
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          { { name = 'path' } },
          { { name = 'cmdline', } }
        )
      })

      -- Add standard completion for code
      cmp.setup({
        -- preselect first item
        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        -- sources list
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
        -- how the shown suggestion is formatted
        formatting = lsp_zero.cmp_format({ details = true }),
        -- my custom mappings
        mapping = {
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-N>'] = cmp.mapping.scroll_docs(-4),
          ['<C-n>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
          }),
        },
        -- specify a snippet engine
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        -- window layout
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
      -- Insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  },

  -- LSP
  { -- Nvim-lspconfig
    'neovim/nvim-lspconfig',
    commit = '9619e53',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'hrsh7th/cmp-nvim-lsp',
        commit = '5af77f5',
      },
      {
        'williamboman/mason-lspconfig.nvim',
        commit = '9dfcf20',
      },
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        -- lsp_zero.default_keymaps({buffer = bufnr})
        require('utils.mapper').map(require('plugins.mappings.Lsp')(bufnr))
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {
          'bashls',
          'clangd',
          'kotlin_language_server',
          'lua_ls',
          'pyright',
          'rust_analyzer',
          'tsserver',
          'typst_lsp',
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  }
}
