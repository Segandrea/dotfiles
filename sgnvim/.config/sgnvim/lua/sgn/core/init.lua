--------------------------------------------------
-- [[ Settings that are unrelated to plugins ]] --
--------------------------------------------------

-- [[ Basic variables ]] {{{
-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- }}}

-- [[ Basic options ]] {{{
-- See `:help vim.o`
require('sgn.core.options')
-- }}}

-- [[ Map shortcut ]] {{{
local map = vim.keymap.set
local options = function(description)
  return { noremap = true, silent = true, desc = description }
end

-- [[ Common insert mode mappings ]]
-- get out of )]}'" by pressing tab in insert, use >, = and < in normal to indent
-- NB: searching for better alternatives
map('i', '<Tab>', '<Right>', options('Use tab to skip a character'))
-- S-tab should not tab
map('i', '<S-Tab>', '<Nop>', options())
-- Ctrl+j and Ctrl+k won't do anything in insert mode so it can be used
map('i', '<C-j>', '<Nop>', options())
map('i', '<C-k>', '<Nop>', options())

-- [[ Common normal mode mappings ]]
-- center search (and highlight search)
map('n', 'n', ':set<space>hlsearch<cr>nzzzv', options('Center and highlight next search'))
map('n', 'N', ':set<space>hlsearch<cr>Nzzzv', options('Center and highlight previous search'))
-- indent shortcut
map('n', '>', '>>', options('Indent to right'))
map('n', '<', '<<', options('Indent to left'))
-- switch off highlight
map('n', '<Esc>', ':set<space>nohlsearch<cr><esc>', options('Deactivate highlight'))
-- TODO: learn about jumplist and remove these
-- add mark to go (b)ack after jump (and highlight search)
map('n', '/', ':set<space>hlsearch<cr>mb/', options('Mark starting point and highlight next searched word'))
map('n', '*', ':set<space>hlsearch<cr>mb*', options('Mark starting point and highlight next match'))
map('n', '?', ':set<space>hlsearch<cr>mb?', options('Mark starting point and highlight prev searched word'))
map('n', '#', ':set<space>hlsearch<cr>mb#', options('Mark starting point and highlight prev match'))
-- use to go back to the position where you were when search started
map('n', '<leader>gb', "'b", options('[b]ack'))
-- go to next/previous fold
map('n', '<leader>gnf', 'zj', options('[f]old'))
map('n', '<leader>gpf', 'zk', options('[f]old'))
-- Space won't make a move so it can be used as leader
map('n', '<Space>', '<Nop>', options())
-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true})
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true})

-- [[ Common visual mode mappings ]]
-- move lines
map('v', 'K', ":m<space>'<-2<cr>gv=gv", options('Move current line above'))
map('v', 'J', ":m<space>'>+1<cr>gv=gv", options('Move current line below'))
-- keep selected after selection increment
map('v', '<C-a>', '<C-a>gv', options('Increment and keep selected'))
map('v', '<C-x>', '<C-x>gv', options('Decrement and keep selected'))
map('v', 'g<C-a>', 'g<C-a>gv', options('Increment progressively and keep selected'))
map('v', 'g<C-x>', 'g<C-x>gv', options('Decrement progressively and keep selected'))
-- keep selection while indenting
map('v', '>', '>gv', options('Indent right and keep selected'))
map('v', '<', '<gv', options('Indent left and keep selected'))
-- Space won't make a move so it can be used as leader
map('v', '<Space>', '<Nop>', options())
-- }}}

-- [[ Basic autocmds ]] {{{
-- see `:help vim.api.nvim_create_autocmd`
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  -- See `:help vim.highlight.on_yank()`
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = '*',
})

-- Change formatoptions when opening a buffer (removed 'o')
autocmd('VimEnter', { pattern = '*', callback = function() vim.bo.formatoptions = 'jcql' end })
-- Center view when entering insert mode
autocmd('InsertEnter', { pattern = '*', command = 'norm zz' })
-- Switch off highlighting when entering insert mode
autocmd('InsertEnter', { pattern = '*', command = 'set nohlsearch' })
-- Save last editing position
autocmd('BufReadPost', { pattern = '*', command = [[if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"" | endif]] })
-- }}}

-- vim: foldmethod=marker foldlevel=0
