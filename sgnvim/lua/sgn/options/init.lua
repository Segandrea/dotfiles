vim.g.mapleader = ' '
-- list of options
vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 2
vim.opt.encoding = "utf-8"
vim.bo.expandtab = true
vim.opt.foldenable = true
-- vim.opt.foldlevel = 99                   -- moved in plugins/treesitter.lua
-- vim.opt.foldmethod = "expr"              -- moved in plugins/treesitter.lua
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.listchars.tab = '>'
vim.opt.listchars.trail = '·'
vim.opt.mousehide = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.sidescroll = 1
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmenu = true
vim.opt.wrap = false

-- TODO: remove r, o
--vim.opt.formatoptions = vim.opt.formatoptions .. 'tcjql'

-- TODO: add dependance on filetype
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

-- TODO: add a different colorscheme
vim.cmd[[colorscheme dracula]]
