-- [[ Essential settings ]]
require('sgn.essential')

-- [[ Bootstrap packer ]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- [[ List of plugins ]]
return require('packer').startup(function(use)
  -- [[ Packer ]]
  use({'wbthomason/packer.nvim'})

  -- [[ Treesitter ]]
  use({ 'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects', -- treesitter text objects
      'nvim-treesitter/nvim-treesitter-context',     -- show function of context
      'windwp/nvim-ts-autotag',                      -- autoclose html tags
      'p00f/nvim-ts-rainbow',                        -- coloured parenthesis
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
        show_trailing_blankline_indent = false,
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

  -- [[ Autodetect indentation ]]
  use({ 'tpope/vim-sleuth' }) -- Detect tabstop and shiftwidth automatically

  -- [[ Colorschemes ]]
  use({ 'dracula/vim',
    as = 'dracula',
    config = function() vim.cmd('colorscheme dracula') end,
    -- require = { 'other/colorschemes' },
  })

  -- [[ Lsp ]]
  use({ 'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
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

  -- [[ Markdown wiki ]]
  use({ 'jakewvincent/mkdnflow.nvim',
    rocks = 'luautf8',
    ft = 'markdown',
    config = function() require('sgn.markdown') end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
