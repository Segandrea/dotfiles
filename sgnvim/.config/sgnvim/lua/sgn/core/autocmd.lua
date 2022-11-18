-- Core autocmds for the configuration
-- Will probably be overwritten by plugins

-- see `:help vim.api.nvim_create_autocmd`
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup( 'YankHighlight', { clear = true })
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
