local map = vim.keymap.set
local options = { noremap = true, silent = true }

-- normal mode mappings
map('n', '<Esc>', ':set<space>nohlsearch<cr><esc>', options)
map('n', 'n', ':set<space>hlsearch<cr>nzzzv', options)
map('n', 'N', ':set<space>hlsearch<cr>Nzzzv', options)
map('n', '/', ':set<space>hlsearch<cr>mb/', options)
map('n', '?', ':set<space>hlsearch<cr>mb?', options)
map('n', '*', ':set<space>hlsearch<cr>mb*', options)
map('n', 'J', 'mtJ`t', options)
map('n', '>', '>>', options)
map('n', '<', '<<', options)

-- visual mode mappings
map('v', 'K', ":m<space>'<-2<cr>gv=gv", options)
map('v', 'J', ":m<space>'>+1<cr>gv=gv", options)
map('v', '>', ">gv", options)
map('v', '<', "<gv", options)
map('v', '<C-a>', "<C-a>gv", options)
map('v', '<C-x>', "<C-x>gv", options)

-- [[
--
-- NB. plugin dependant mappings will be in their config files
--
-- ]]
