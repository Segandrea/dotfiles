local gs = require('gitsigns')
-- [[ Mappings ]]
local function on_attach(bufnr)
  local map = vim.keymap.set
  local options = function(description)
    return { noremap = true, buffer = bufnr, silent = true, desc = description }
  end

  -- go to next git diff in file
  map('n', '<leader>gnd', function()
    -- required to have the binding usable when there is no diff
    if vim.wo.diff then return '<leader>gnd' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
  end, options('[d]iff'))
  -- go to previous git diff in file
  map('n', '<leader>gpd', function()
    -- required to have the binding usable when there is no diff
    if vim.wo.diff then return '<leader>gpd' end
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
  end, options('[d]iff'))
  -- reset diffs on current line
  map('n', '<leader>Grl', gs.reset_hunk, options('[l]ine'))
  -- reset diffs on current buffer
  map('n', '<leader>Grb', gs.reset_buffer, options('[b]uffer'))
  -- toggle git blame of the buffer
  map('n', '<leader>Gbb', function() gs.blame_line({ full = true }) end, options('[b]uffer'))
  -- toggle git blame of the line
  map('n', '<leader>Gbl', gs.blame_line, options('[l]ine'))

  -- [[ Text object: hunk ]] NB. used with visual selection. Select in current diff
  map({'o', 'x'}, 'ih', gs.select_hunk)
end

gs.setup({
  signs = {
    add = {
      hl = "GitSignsAdd",
      text = "│",
      numhl = "GitSignsAddNr",
      linehl = "GitSignsAddLn",
    },
    change = {
      hl = "GitSignsChange",
      text = "│",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
    delete = {
      hl = "GitSignsDelete",
      text = "-",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    topdelete = {
      hl = "GitSignsDelete",
      text = "‾",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    changedelete = {
      hl = "GitSignsChange",
      text = "~",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },
  on_attach = on_attach,
  numhl = false,
  linehl = false,
  watch_gitdir = { interval = 1000, follow_files = true },
  current_line_blame_opts = {
    delay = 1000,
    position = "eol",
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  diff_opts = {
    internal = true, -- If luajit is present
  },
})
