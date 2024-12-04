  return {
    { -- Show context of the code at the top
      'nvim-treesitter/nvim-treesitter-context',
      commit = 'f197661',
      dependencies = {
        'nvim-treesitter/nvim-treesitter',
      }
    },
    { -- Text objects for functions and classes
      'nvim-treesitter/nvim-treesitter-textobjects',
      commit = 'f5183ce',
      dependencies = {
        'nvim-treesitter/nvim-treesitter',
      }
    },
    { -- Treesitter
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      event = { 'VeryLazy', 'VimEnter' },
      main = 'nvim-treesitter.configs',
      opts = {
        -- Auto-install all languages
        ensure_installed = 'all',
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = false,
          keymaps = {
            -- set these to false to disable them
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },

        -- [[ nvim-treesitter-textobjects ]]
        -- Look their README, this can be customized even more, it's really cool
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['ic'] = { query = '@class.inner', desc = '[i]nside [c]lass' },
              ['ac'] = { query = '@class.outer', desc = '[a]round [c]lass' },
              ['if'] = { query = '@function.inner', desc = '[i]nside [f]unction' },
              ['af'] = { query = '@function.outer', desc = '[a]round [f]unction' },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>sp'] = { query = '@parameter.inner', desc = '[p]arameters forward'},
            },
            swap_previous = {
              ['<leader>sP'] = { query = '@parameter.inner', desc = '[P]arameters backward'},
            },
          },
        },
      },
    }
  }
