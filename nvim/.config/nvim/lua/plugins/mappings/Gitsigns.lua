local gs = require('gitsigns')
return function(bufnr)
  return {
    { -- Go to next git diff in file
      mode = 'n',
      key = 'gnD',
      act = function()
        if vim.wo.diff then
          vim.cmd.normal({ 'gnD', bang = true })
        else
          gs.nav_hunk('next')
        end
      end,
      desc = '[D]iff',
      buffer = bufnr,
    },
    { -- Go to previous git diff in file
      mode = 'n',
      key = 'gpD',
      act = function()
        if vim.wo.diff then
          vim.cmd.normal({ 'gpD', bang = true })
        else
          gs.nav_hunk('prev')
        end
      end,
      desc = '[D]iff',
      buffer = bufnr,
    },
    -- Stage diffs in line
    { mode = 'n',          key = '<leader>gsh', act = gs.stage_hunk,                                 desc = '[h]unk',          buffer = bufnr, },
    -- Reset diffs on current line
    { mode = 'n',          key = '<leader>grh', act = gs.reset_hunk,                                 desc = '[h]unk',          buffer = bufnr, },
    -- Stage diffs in buffer
    { mode = 'n',          key = '<leader>gsb', act = gs.stage_buffer,                               desc = '[b]uffer',        buffer = bufnr, },
    -- Reset diffs on current buffer
    { mode = 'n',          key = '<leader>grb', act = gs.reset_buffer,                               desc = '[b]uffer',        buffer = bufnr, },
    -- Toggle git blame of the buffer
    { mode = 'n',          key = '<leader>gb',  act = function() gs.blame_line({ full = true }) end, desc = '[b]lame',        buffer = bufnr, },
    -- Git diff
    { mode = 'n',          key = '<leader>gd',  act = gs.diffthis,                                   desc = '[d]iff',          buffer = bufnr, },
    -- Preview hunk
    { mode = 'n',          key = '<leader>gp',  act = gs.preview_hunk,                               desc = '[p]review',       buffer = bufnr, },
    -- Unstage diffs in line
    { mode = 'n',          key = '<leader>gu',  act = gs.undo_stage_hunk,                            desc = '[u]nstage hunk',  buffer = bufnr, },

    -- [[ Text object: hunk ]] NB. used with visual selection. Select in current diff
    { mode = { 'o', 'x' }, key = 'ih',          act = gs.select_hunk,                                desc = 'Object: git hunk' },
  }
end
