local map = vim.keymap.set
local options = { noremap = true, silent = true }

--[[ Normal mode mappings ]]
-- Highlight and centering during search
map('n', '<Esc>', ':set<space>nohlsearch<cr><esc>', options)
map('n', 'n', ':set<space>hlsearch<cr>nzzzv', options)
map('n', 'N', ':set<space>hlsearch<cr>Nzzzv', options)
-- Highlight and make marks durung search
map('n', '/', ':set<space>hlsearch<cr>mb/', options)
map('n', '?', ':set<space>hlsearch<cr>mb?', options)
map('n', '*', ':set<space>hlsearch<cr>mb*', options)
-- Join lines and remain in position
map('n', 'J', 'mtJ`t', options)
-- Indent with a single > or <
map('n', '>', '>>', options)
map('n', '<', '<<', options)

--[[ Visual mode mappings ]]
-- Move lines
map('v', 'K', ":m<space>'<-2<cr>gv=gv", options)
map('v', 'J', ":m<space>'>+1<cr>gv=gv", options)
-- Keep selected while indenting
map('v', '>', ">gv", options)
map('v', '<', "<gv", options)
-- Keep selected while incrementing
map('v', '<C-a>', "<C-a>gv", options)
map('v', '<C-x>', "<C-x>gv", options)
-- Keep selected while making a crescent increment
map('v', '<C-S-a>', "g<C-a>gv", options)
map('v', '<C-S-x>', "g<C-x>gv", options)
