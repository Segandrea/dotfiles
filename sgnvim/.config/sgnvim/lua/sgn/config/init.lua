return {
  -- Packer can think about himself {{{
  { 'wbthomason/packer.nvim' }, -- }}}
  -- Treesitter
  { -- Treesitter {{{
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('sgn.config.treesitter') end,
    requires = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' }, -- treesitter text objects
      { 'nvim-treesitter/nvim-treesitter-context' }, -- show function of context
      { 'JoosepAlviste/nvim-ts-context-commentstring' }, -- use tree sitter to set commentstring
      { 'windwp/nvim-ts-autotag' }, -- autoclose html tags
      { 'p00f/nvim-ts-rainbow' }, -- coloured parenthesis
    },
  }, -- }}}
  -- Navigation
  { -- Tmux {{{
    'aserowy/tmux.nvim',
    config = function() require('sgn.config.tmux') end,
  }, -- }}}
  { -- Telescope {{{
    'nvim-telescope/telescope.nvim',
    config = function() require('sgn.config.telescope') end,
    branch = '0.1.x',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { -- improve performance
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable "make" == 1
      },
    },
  }, -- }}}
  { -- Filetree navigator {{{
    'nvim-tree/nvim-tree.lua',
    config = function() require('sgn.config.nvim-tree') end,
    requires = { 'kyazdani42/nvim-web-devicons' },
  }, -- }}}
  -- Lsp
  { -- Lsp-Zero {{{
    'VonHeikemen/lsp-zero.nvim',
    config = function() require('sgn.config.lsp-zero') end,
    requires = {
      -- LSP Support {{{
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { -- configure sumneko to give better suggestion for anything plugin related
        'folke/neodev.nvim',
        config = function() require('neodev').setup() end,
        ft = 'lua',
      }, -- }}}
      -- LSP Improvement {{{
      { -- Inject lsp actions like formatting from external tools
        'jose-elias-alvarez/null-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('sgn.config.null-ls') end,
      },
      { -- Improve project structure management
        'ahmedkhalf/project.nvim',
        config = function() require('project_nvim').setup() end,
      }, -- }}}
      -- LSP Completion {{{
      { -- Autocompletion
        'hrsh7th/nvim-cmp',
        config = function() require('sgn.config.nvim-cmp') end,
        requires = {
          { 'onsails/lspkind.nvim' },
          { 'hrsh7th/cmp-buffer' },
          { 'hrsh7th/cmp-path' },
          { 'saadparwaiz1/cmp_luasnip' },
          { 'hrsh7th/cmp-nvim-lsp' },
          { 'hrsh7th/cmp-nvim-lua' },
          { 'kdheepak/cmp-latex-symbols' },
          { -- Snippets
            'L3MON4D3/LuaSnip',
            config = function() require('sgn.config.luasnip') end,
            requires = { 'rafamadriz/friendly-snippets' },
          },
        },
      }, -- }}}
    },
  }, -- }}}
  -- Ui
  { --  Indent lines {{{
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({ char = '┊', show_current_context = true })
    end,
  }, -- }}}
  { -- Dracula Colorscheme {{{
    'dracula/vim',
    config = function() vim.cmd('colorscheme dracula') end,
    as = 'dracula',
  }, -- }}}
  { -- Zen Mode {{{
    'folke/zen-mode.nvim',
    config = function() require('sgn.config.zen-mode') end,
    requires = { 'folke/twilight.nvim', },
  }, -- }}}
  { -- Highlight arguments {{{
    'm-demare/hlargs.nvim',
    config = function() require('hlargs') end,
    requires = { 'nvim-treesitter/nvim-treesitter', },
  }, -- }}}
  { -- Trouble display diagnostics {{{
    'folke/trouble.nvim',
    config = function() require('sgn.config.trouble') end,
    requires = 'kyazdani42/nvim-web-devicons',
  }, -- }}}
  { -- Todo and fixme highlighter {{{
    'folke/todo-comments.nvim',
    config = function() require('sgn.config.todo-comments') end,
  }, -- }}}
  { -- Highlight hex/rgb/etc. colors {{{
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({
        enable_tailwind = true,
      })
    end,
  }, -- }}}
  -- Editor utilities
  -- Editorconfig support {{{
  { 'gpanders/editorconfig.nvim' }, -- }}}
  { -- Comment {{{
    'numToStr/Comment.nvim',
    config = function() require('sgn.config.comment') end,
  }, -- }}}
  { -- Tab bar {{{
    'romgrk/barbar.nvim',
    as = 'barbar',
    config = function() require('sgn.config.barbar') end,
    requires = { 'kyazdani42/nvim-web-devicons' },
  }, -- }}}
  { -- Autopairs {{{
    'windwp/nvim-autopairs',
    config = function() require('sgn.config.nvim-autopairs') end,
  }, -- }}}
  { -- Git signs {{{
    'lewis6991/gitsigns.nvim',
    config = function() require('sgn.config.gitsigns') end,
  }, -- }}}
  { -- Align text {{{
    'Vonr/align.nvim',
    config = function() require('sgn.config.align') end,
  }, -- }}}
  { -- Which-key {{{
    'folke/which-key.nvim',
    config = function() require('sgn.config.whichkey') end,
  }, -- }}}
  -- Markdown
  { -- Markdown related plugins {{{
    'jakewvincent/mkdnflow.nvim',
    config = function() require('sgn.config.mkdnflow') end,
    rocks = 'luautf8',
    ft = 'markdown',
    requires = {
      { 'jubnzv/mdeval.nvim', ft = 'markdown', },
      { 'iamcco/markdown-preview.nvim', run = function() vim.fn["mkdp#util#install"]() end, ft = 'markdown', },
    }
  }, -- }}}
  -- Neorg
  { -- Neorg support {{{
    'nvim-neorg/neorg',
    config = function() require('sgn.config.neorg') end,
    ft = 'norg',
    after = 'nvim-treesitter',
    requires = 'nvim-lua/plenary.nvim',
  }, -- }}}
}
-- vim: foldmethod=marker foldminlines=0 foldlevel=0
