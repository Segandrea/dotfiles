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

-- use system clipboard
vim.o.clipboard = 'unnamedplus'

-- conceal text
vim.wo.conceallevel = 2

-- highlight cursor line
vim.wo.cursorline = true

-- indentation and whitespaces
vim.o.smartindent = true
vim.o.smarttab = true
vim.bo.softtabstop = 2
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

-- show trailing spaces
vim.o.list = true
vim.opt.listchars = { trail = '•', tab = '  ', extends = 'ﲖ', precedes = 'ﲕ' }

-- scrolloff
vim.o.scrolloff = 5
vim.o.sidescroll = 3

-- encoding
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'

-- folding
vim.o.foldenable = true
vim.o.foldlevel = 99

-- do not show status
vim.o.laststatus = 0

-- split in the right direction
vim.o.splitbelow = true
vim.o.splitright = true

-- highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

-- relative numbers for lines
vim.wo.number = true
vim.wo.relativenumber = true

-- avoid wrapping
vim.o.wrap = false
-- when wrapping is unavoidable, wrap better
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- smart search
vim.o.ignorecase = true
vim.o.smartcase = true

-- decrease time between updates of the swap file
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- better command completion
vim.o.completeopt = 'menuone,noselect'

-- use gui colors instead of cterm
vim.o.termguicolors = true

-- decrease time before whichkey appearance
vim.o.timeoutlen = 0
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
map('n', '<leader>gb', "'b", options('[G]o back to mark [b]'))
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

-- Center view when entering insert mode
autocmd('InsertEnter', { pattern = '*', command = 'norm zz' })
-- Switch off highlighting when entering insert mode
autocmd('InsertEnter', { pattern = '*', command = 'set nohlsearch' })
-- Save last editing position
autocmd('BufReadPost', { pattern = '*', command = [[if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"" | endif]] })
-- }}}

-- vim: foldmethod=marker foldlevel=0
