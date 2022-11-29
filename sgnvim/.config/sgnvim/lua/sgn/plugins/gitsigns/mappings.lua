local gs = require('gitsigns')
return function(bufnr)
  require('sgn.core.keybinder').map({
   { -- go to next git diff in file
      mode = 'n',
      key = '<leader>gnd',
      act = function()
        if vim.wo.diff then return '<leader>gnd' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end,
      desc = '[d]iff',
      buffer = bufnr,
    },
   { -- go to previous git diff in file
      mode = 'n',
      key = '<leader>gpd',
      act = function()
        if vim.wo.diff then return '<leader>gpd' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end,
      desc = '[d]iff',
      buffer = bufnr,
    },
    -- reset diffs on current line
    { mode = 'n', key = '<leader>Grl', act = gs.reset_hunk, desc = '[l]ine', buffer = bufnr, },
    -- reset diffs on current buffer
    { mode = 'n', key = '<leader>Grb', act = gs.reset_buffer, desc = '[b]uffer', buffer = bufnr, },
    -- toggle git blame of the buffer
    { mode = 'n', key = '<leader>Gbb', act = function() gs.blame_line({ full = true }) end, desc = '[b]uffer', buffer = bufnr, },
    -- toggle git blame of the line
    { mode = 'n', key = '<leader>Gbl', act = gs.blame_line, desc = '[l]ine', buffer = bufnr, },

    -- [[ Text object: hunk ]] NB. used with visual selection. Select in current diff
    { mode = { 'o', 'x' }, key = 'ih', act = gs.select_hunk, desc = 'Object: git hunk' },
  })
end
