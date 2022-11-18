-- [[ Essential settings ]]
require('sgn.core')

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

  -- [[ Startup speedup ]]
  use({ 'lewis6991/impatient.nvim', })
  require('impatient') -- Needs to be called as fast as possible after loading

  -- [[ Treesitter ]]
  use({ 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('sgn.treesitter') end,
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects', -- treesitter text objects
      'nvim-treesitter/nvim-treesitter-context', -- show function of context
      'JoosepAlviste/nvim-ts-context-commentstring', -- use tree sitter to set commentstring
      'windwp/nvim-ts-autotag', -- autoclose html tags
      'p00f/nvim-ts-rainbow', -- coloured parenthesis
    },
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
    config = function() require('sgn.telescope') end,
    branch = '0.1.x',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { -- improve performance
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable "make" == 1
      },
    },
  })

  -- [[ Colorschemes ]]
  use({ 'dracula/vim',
    config = function() vim.cmd('colorscheme dracula') end,
    as = 'dracula',
  })

  -- [[ Lsp ]]
  use({ 'VonHeikemen/lsp-zero.nvim',
    config = function() require('sgn.lsp') end,
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { -- configure sumneko to give better suggestion for anything plugin related
        'folke/neodev.nvim',
        config = function() require('neodev').setup() end,
        ft = 'lua',
      },
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
    { -- markdown support
      'jakewvincent/mkdnflow.nvim',
      rocks = 'luautf8',
      ft = 'markdown',
      config = function() require('sgn.markdown') end,
    },
    { -- evaluate code in md files
      'jubnzv/mdeval.nvim',
      ft = 'markdown',
    },
    { -- live render md in pdf reader
      'iamcco/markdown-preview.nvim',
      run = function() vim.fn["mkdp#util#install"]() end,
      ft = 'markdown',
    },
  })

  -- [[ Neorg support ]]
  use({ 'nvim-neorg/neorg',
    config = function() require('sgn.neorg') end,
    ft = 'norg',
    after = 'nvim-treesitter',
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
    config = function() require('sgn.zen') end,
    requires = { 'folke/twilight.nvim', },
  })

  -- [[ Highlight arguments ]]
  use({ 'm-demare/hlargs.nvim',
    config = function() require('hlargs') end,
    requires = { 'nvim-treesitter/nvim-treesitter', },
  })

  -- [[ Show nicer diagnostics ]]
  use({ 'folke/trouble.nvim',
    config = function() require('sgn.trouble') end,
    requires = 'kyazdani42/nvim-web-devicons',
  })

  -- [[ Todo and fixme highlighter ]]
  use({ 'folke/todo-comments.nvim',
    config = function() require('sgn.todo') end,
  })

  -- [[ Comment ]]
  use({ 'numToStr/Comment.nvim',
    config = function() require('sgn.comment') end,
  })

  -- [[ Tab bar ]]
  use({ 'romgrk/barbar.nvim',
    config = function() require('sgn.buftabbar') end,
    requires = { 'kyazdani42/nvim-web-devicons' },
  })

  -- [[ Tree navigator ]]
  use({ 'nvim-tree/nvim-tree.lua',
    config = function() require('sgn.tree') end,
    requires = { 'kyazdani42/nvim-web-devicons' },
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
