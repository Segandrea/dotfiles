local autocmd = vim.api.nvim_create_autocmd

-- Center view when entering insert mode
autocmd('InsertEnter', { pattern = '*', command = 'norm zz' })
-- Switch off highlight when entering insert mode
autocmd('InsertEnter', { pattern = '*', command = 'set nohlsearch' })
-- Save last editing position
autocmd('BufReadPost', { pattern = '*', command = [[if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"" | endif]] })

