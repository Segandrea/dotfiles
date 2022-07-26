--[[-------------------------- Basic Configs ------------------------------]]--
--   These are the configs for options, variables, mappings and autocmds     --
--   that aren't related to plugins.                                         --
--[[-----------------------------------------------------------------------]]--

require('barquonvim.basics.options')
require('barquonvim.basics.variables')
require('barquonvim.basics.mappings')
require('barquonvim.basics.autocmds')


--[[----------------------- List of Packages ------------------------------]]--
--   List of the used plugins.                                               --
--   Config files for the plugins below, are placed in the directory         --
--   `barquonvim/plugins` in directories with the same name of the           --
--   plugin followed by `-config` (eventual dots in the name will be         --
--   removed). Eg. if the plugin is called `foo.nvim`, the configs will      --
--   be in `barquonvim/plugins/foo-config/`.                                 --
--   Config files will also contain autocmds and mappings related to         --
--   the plugin. Mappings will probably be always registered by which-key    --
--[[-----------------------------------------------------------------------]]--

require('packer').startup(function(use)
  -- Packer can manage itself
  use({ 'wbthomason/packer.nvim' })

  -- Use treesitter and related extensions
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('barquonvim.plugins.treesitter-config') end,
  })
  use({ 'p00f/nvim-ts-rainbow' })

  -- Seamless navigation between tmux panes and vim splits
  use({
    'aserowy/tmux.nvim',
    config = function() require('barquonvim.plugins.tmux-config') end,
  })

  -- Dracula colorscheme
  use({
    'dracula/vim',
    as = 'dracula',
    setup = function() require('barquonvim.plugins.dracula-config') end,
    config = function() vim.cmd('colorscheme dracula') end,
  })

  -- Which-key to add keybindings
  use({
    'folke/which-key.nvim',
    config = function() require('barquonvim.plugins.which-key-config') end,
  })

  -- Zen mode
  use({
    'folke/zen-mode.nvim',
    config = function() require('barquonvim.plugins.zen-mode-config') end,
  })

  -- Icons for plugins
  use({
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('barquonvim.plugins.nvim-web-devicons-config')
    end,
  })

  -- lsp (preconfigured with lsp-zero.nvim)
  use({
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/nvim-lsp-installer'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    },
    -- this module will contain all lsp related configs
    config = function() require('barquonvim.plugins.lsp-config') end,
  })

  -- autopairs
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('barquonvim.plugins.nvim-autopairs-config')
    end,
  })

  -- indent lines
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function ()
      require('barquonvim.plugins.indent-blankline-config')
    end,
  })

  -- dashboard
  use({
    'glepnir/dashboard-nvim',
    config = function ()
      require('barquonvim.plugins.dashboard-nvim-config')
    end,
  })

  -- render latex in neovim
  use({
    'jbyuki/nabla.nvim',
    ft = { 'markdown', 'latex', 'norg' },
    config = function()
      require('barquonvim.plugins.nabla-config')
    end,
  })

end)
