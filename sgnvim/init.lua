-- [[ Essential settings ]]
require('sgn.essential')

-- [[ Bootstrap packer ]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- [[ List of plugins ]]
return require('packer').startup(function(use)
  -- [[ Packer ]]
  use({ 'wbthomason/packer.nvim' })

  -- [[ Treesitter ]]
  use({ 'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects', -- treesitter text objects
      'nvim-treesitter/nvim-treesitter-context', -- show function of context
      'JoosepAlviste/nvim-ts-context-commentstring', -- use tree sitter to set commentstring
      'windwp/nvim-ts-autotag', -- autoclose html tags
      'p00f/nvim-ts-rainbow', -- coloured parenthesis
    },
    run = ':TSUpdate',
    config = function() require('sgn.treesitter') end,
  })

  -- [[ TMUX navigation ]]
  use({ 'aserowy/tmux.nvim',
    config = function() require('sgn.tmux') end,
  })

  -- [[ Indent lines ]]
  use({ 'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        char = '┊',
        show_current_context = true,
      })
    end,
  })

  -- [[ Telescope ]]
  use({ 'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { -- improve performance
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable "make" == 1
      },
    },
    config = function() require('sgn.telescope') end,
  })

  -- [[ Colorschemes ]]
  use({ 'dracula/vim',
    as = 'dracula',
    config = function() vim.cmd('colorscheme dracula') end,
  })

  -- [[ Lsp ]]
  use({ 'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { -- Inject lsp things like formatting from tools external to nvim
        'jose-elias-alvarez/null-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('sgn.null-ls') end,
      },
      { -- Autocompletion
        'hrsh7th/nvim-cmp',
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
            requires = { 'rafamadriz/friendly-snippets' },
            config = function() require('sgn.snippets') end,
          },
        },
        config = function() require('sgn.cmp') end,
      },
    },
    config = function() require('sgn.lsp') end,
  })

  -- [[ Autopairs ]]
  use({ 'windwp/nvim-autopairs',
    config = function() require('sgn.autopairs') end,
  })

  -- [[ Git signs ]]
  use({ 'lewis6991/gitsigns.nvim',
    config = function() require('sgn.gitsigns') end,
  })

  -- [[ Highlight hex/rgb/etc. colors ]]
  use({ 'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({
        enable_tailwind = true,
      })
    end,
  })

  -- [[ Markdown ]]
  use({
    {
      'jakewvincent/mkdnflow.nvim',
      rocks = 'luautf8',
      ft = 'markdown',
      config = function() require('sgn.markdown') end,
    }, -- markdown support
    { 'jubnzv/mdeval.nvim', ft = 'markdown', }, -- evaluate code in md files
    {
      'iamcco/markdown-preview.nvim',
      run = function() vim.fn["mkdp#util#install"]() end,
      ft = 'markdown',
    }, -- live render md in pdf reader
  })

  -- [[ Neorg support ]]
  use({ 'nvim-neorg/neorg',
    ft = 'norg',
    run = ':Neorg sync-parsers',
    after = 'nvim-treesitter',
    config = function() require('sgn.neorg') end,
    requires = 'nvim-lua/plenary.nvim',
  })

  -- [[ Which-key ]]
  use({ 'folke/which-key.nvim',
    config = function() require('sgn.whichkey') end,
  })

  -- [[ Project management ]]
  use({ 'ahmedkhalf/project.nvim',
    config = function() require('project_nvim').setup() end,
  })

  -- [[ Zen ]]
  use({ 'folke/zen-mode.nvim',
    requires = { 'folke/twilight.nvim', },
    config = function() require('sgn.zen') end,
  })

  -- [[ Highlight arguments ]]
  use({ 'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter', },
    config = function() require('hlargs') end,
  })

  -- [[ Show nicer diagnostics ]]
  use({ 'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('sgn.trouble') end,
  })

  -- [[ Todo and fixme highlighter ]]
  use({ 'folke/todo-comments.nvim',
    config = function() require('sgn.todo') end,
  })

  -- [[ Comment ]]
  use({ 'numToStr/Comment.nvim',
    config = function() require('sgn.comment') end
  })

  -- [[ Editorconfig support ]]
  use({ 'gpanders/editorconfig.nvim' })
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
-- vim: foldmethod=indent foldminlines=0 foldlevel=1
