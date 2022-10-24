require('neorg').setup({
  ['core.defaults'] = {},
  ['core.keybinds'] = {
    config = {
      default_keybinds = false,
      hook = function(keybinds)
        -- TODO: register here keybindings (try using '<leader>n')
        keybinds = keybinds -- TODO: remove this, it's for lsp (unused) hint
      end,
    }
  },
  ['core.norg.journal'] = {
    config = {
      workspace = '~/Documents/journal',
      journal_folder = nil,
    }
  },
  ['core.norg.qol.toc'] = {
    config = {
      close_split_on_jump = true,
    }
  },
  -- [[ Modules not loaded with core.default ]]
  -- use treesitter to move around in the document
  ['core.norg.manoeuvre'] = {},
  -- read about Get Things Done here: https://hamberg.no/gtd
  ['core.gtd.base'] = {},
  -- use `folke/zen-mode.nvim` to powerpoint-like present with nvim
  -- ['core.presenter'] = {}, -- TODO: do I need this?
  ['core.export'] = {},
  ['core.export.markdown'] = {},
  -- manage directories of norg
  ['core.norg.dirman'] = {
    config = {
      workspaces = {
        notes = '~/Documents/notes',
        journal = '~/Documents/journal',
      },
    }
  },
  ['core.norg.concealer'] = {},
  ['core.norg.completion'] = {
    config = {
      engine = 'nvim-cmp',
    }
  },
  -- [[ Modules that integrate with other plugins ]]
  -- Integration with 'hrsh7th/nvim-cmp'
  ['core.integrations.nvim-cmp'] = {},
})
