require("gitsigns").setup({
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
      text = "_",
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

-- [[ Mappings ]]
local map = vim.keymap.set
local options = function(description)
  return { noremap = true, buffer = true, expr = true, silent = true, desc = description }
end

-- go to next git diff in file
map('n', '<leader>dn', function()
  if vim.wo.diff then return '<leader>dn' end
  vim.schedule(function() require('gitsigns').next_hunk() end)
  return '<Ignore>'
end, options('Go to [d]iff [n]ext'))
-- go to previous git diff in file
map('n', '<leader>dp', function()
  if vim.wo.diff then return '<leader>dp' end
  vim.schedule(function() require('gitsigns').prev_hunk() end)
  return '<Ignore>'
end, options('Go to [d]iff [p]revious'))

-- [[ Text object: hunk ]] NB. used with visual selection. Select in current diff
map({'o', 'x'}, 'ih', require('gitsigns').select_hunk)
