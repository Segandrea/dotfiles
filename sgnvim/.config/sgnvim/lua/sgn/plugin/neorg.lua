-- TODO: do some configuration and mapping
require('neorg').setup({
  load = {
    ['core.defaults'] = {},
    -- manage directories of norg
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          notes = '~/Documents/notes',
          journal = '~/Documents/journal',
        },
      }
    },
    -- ['core.keybinds'] = {
    --   config = {
    --     default_keybinds = false,
    --     hook = function(keybinds)
    --       -- start "norg" mode
    --       keybinds.map('all', 'n', '<leader>nmn', '<cmd>Neorg mode norg<CR>')
    --       -- mark task under the cursor as undone
    --       keybinds.map('norg', 'n', '<leader>ntu', 'core.norg.qol.todo_items.todo.task_undone')
    --       -- mark task under the cursor as pending
    --       keybinds.map('norg', 'n', '<leader>ntp', 'core.norg.qol.todo_items.todo.task_pending')
    --       -- mark task under the cursor as done
    --       keybinds.map('norg', 'n', '<leader>ntd', 'core.norg.qol.todo_items.todo.task_done')
    --       -- mark task under the cursor as on hold
    --       keybinds.map('norg', 'n', '<leader>nth', 'core.norg.qol.todo_items.todo.task_on_hold')
    --       -- mark task under the cursor as cancelled
    --       keybinds.map('norg', 'n', '<leader>ntc', 'core.norg.qol.todo_items.todo.task_cancelled')
    --       -- mark task under the cursor as recurring
    --       keybinds.map('norg', 'n', '<leader>ntr', 'core.norg.qol.todo_items.todo.task_recurring')
    --       -- mark task under the cursor as important
    --       keybinds.map('norg', 'n', '<leader>nti', 'core.norg.qol.todo_items.todo.task_important')
    --       -- capture new task
    --       keybinds.map('norg', 'n', '<leader>ntn', 'core.gtd.base.capture')
    --       -- view tasks
    --       keybinds.map('norg', 'n', '<leader>ntv', 'core.gtd.base.views')
    --       -- edit task
    --       keybinds.map('norg', 'n', '<leader>nte', 'core.gtd.base.edit')
    --       -- make a new .norg note
    --       keybinds.map('norg', 'n', '<leader>nn', 'core.norg.dirman.new.note')
    --       -- follow the link under the cursor
    --       keybinds.map('norg', 'n', '<leader>gl', 'core.norg.esupports.hop.hop-link')
    --       -- follow the link under the cursor
    --       keybinds.map('norg', 'n', '<CR>', 'core.norg.esupports.hop.hop-link')
    --       -- promote
    --       keybinds.map('norg', 'n', '<leader>n>', 'core.promo.promote')
    --       -- demote
    --       keybinds.map('norg', 'n', '<leader>n<', 'core.promo.demote')
    --       -- promote
    --       keybinds.map('norg', 'v', '<leader>n>', '<cmd>Neorg keybind all core.promo.promote_range<cr>')
    --       -- demote
    --       keybinds.map('norg', 'v', '<leader>n<', '<cmd>Neorg keybind all core.promo.demote_range<cr>')
    --       -- enter "traverse-heading" mode
    --       keybinds.map('all', 'n', '<leader>nmt', '<cmd>Neorg mode traverse-heading<CR>')
    --       -- next heading in "traverse-heading" mode
    --       keybinds.map('traverse-heading', 'n', 'j', 'core.integrations.treesitter.next.heading')
    --       -- previous heading in "traverse-heading" mode
    --       keybinds.map('traverse-heading', 'n', 'j', 'core.integrations.treesitter.previous.heading')
    --       -- enter "toc-split" mode
    --       keybinds.map('all', 'n', '<leader>nmh', '<cmd>Neorg toc split<CR>')
    --       -- hop to target in "toc-split" mode
    --       keybinds.map('toc-split', 'n', '<CR>', 'core.norg.qol.toc.hop-toc-link')
    --       -- close split in "toc-split" mode
    --       keybinds.map('toc-split', 'n', 'q', 'core.norg.qol.toc.close')
    --       -- close split in "toc-split" mode
    --       keybinds.map('toc-split', 'n', '<Esc>', 'core.norg.qol.toc.close')
    --       -- hop to task in "gtd-display" mode
    --       keybinds.map('gtd-display', 'n', '<CR>', 'core.gtd.ui.goto_task')
    --       -- close split in "toc-split" mode
    --       keybinds.map('gtd-display', 'n', 'q', 'core.gtd.ui.close')
    --       -- close split in "toc-split" mode
    --       keybinds.map('gtd-display', 'n', '<Esc>', 'core.gtd.ui.close')
    --       -- edit task in "toc-split" mode
    --       keybinds.map('gtd-display', 'n', 'e', 'core.gtd.ui.edit_task')
    --       -- show details in "toc-split" mode
    --       keybinds.map('gtd-display', 'n', 'K', 'core.gtd.ui.details')
    --       -- next slide in "presenter" mode
    --       keybinds.map('presenter', 'n', 'l', 'core.presenter.next_page')
    --       -- next slide in "presenter" mode
    --       keybinds.map('presenter', 'n', '<left>', 'core.presenter.next_page')
    --       -- previous slide in "presenter" mode
    --       keybinds.map('presenter', 'n', 'h', 'core.presenter.previous_page')
    --       -- previous slide in "presenter" mode
    --       keybinds.map('presenter', 'n', '<right>', 'core.presenter.previous_page')
    --       -- close "presenter" mode
    --       keybinds.map('presenter', 'n', '<Esc>', 'core.presenter.close')
    --       -- close "presenter" mode
    --       keybinds.map('presenter', 'n', 'q', 'core.presenter.close')
    --     end,
    --   }
    -- },
    -- ['core.norg.journal'] = {
    --   config = {
    --     workspace = '~/Documents/journal',
    --     journal_folder = nil,
    --   }
    -- },
    ['core.norg.qol.toc'] = {
      config = {
        close_split_on_jump = true,
      }
    },
    -- [[ Modules not loaded with core.default ]]
    -- use treesitter to move around in the document
    ['core.norg.manoeuvre'] = {},
    -- read about Get Things Done here: https://hamberg.no/gtd
    --['core.gtd.base'] = {},
    -- use `folke/zen-mode.nvim` to powerpoint-like present with nvim
    --['core.presenter'] = {}, -- TODO: do I need this?
    ['core.export'] = {},
    ['core.export.markdown'] = {},
    ['core.norg.concealer'] = {},
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      }
    },
    -- [[ Modules that integrate with other plugins ]]
    -- Integration with 'hrsh7th/nvim-cmp'
    ['core.integrations.nvim-cmp'] = {},
  }
})
