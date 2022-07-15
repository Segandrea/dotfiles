local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd('VimEnter', { pattern = '*', command = 'set formatoptions-=cro' })
autocmd('InsertEnter', { pattern = '*', command = 'norm zz' })
autocmd('InsertEnter', { pattern = '*', command = 'set nohlsearch' })
autocmd('BufReadPost', { pattern = '*', command = [[if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"" | endif]] })

-- TODO: add autocmds specific for filetypes
