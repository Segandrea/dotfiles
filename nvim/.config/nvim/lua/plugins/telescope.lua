return {
  {
    'nvim-telescope/telescope.nvim',
    commit = 'd26b666',
    cmd = 'Telescope',
    dependencies = {
      {
        'nvim-lua/plenary.nvim',
        commit = '8aad439',
        lazy = true,
      },
      {
        'ahmedkhalf/project.nvim',
        commit = '8c6bad7',
        event = 'VeryLazy',
        config = function()
          require('project_nvim').setup()
          require('telescope').load_extension('projects')
        end,
      },
    },
    event = 'VimEnter',
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      -- Setup telescope
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ['<C-p>'] = false,
              ['<C-n>'] = false,
              ['<C-j>'] = {
                actions.move_selection_next,
                type = 'action',
                opts = { nowait = true, silent = true },
              },
              ['<C-k>'] = {
                actions.move_selection_previous,
                type = 'action',
                opts = { nowait = true, silent = true },
              },
            },
          },
        },
      })
      -- Mappings (can't be mapped from lazy because of requires)
      require('utils.mapper').map(require('plugins.mappings.Telescope'))
    end,
  },
}
