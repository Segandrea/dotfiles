-- TODO: should be moved in a file var.lua
vim.g.mapleader = ' '

-- [[ Clipboard ]]
vim.opt.clipboard = 'unnamedplus'

-- [[ Readability ]]
vim.opt.conceallevel = 2
vim.opt.list = true
vim.opt.listchars.tab = '>'
vim.opt.listchars.trail = '·'
vim.opt.scrolloff = 5
vim.opt.sidescroll = 1
vim.opt.mousehide = true
vim.opt.wrap = false

-- [[ Encoding ]]
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- [[ Folding ]]
vim.opt.foldenable = true

-- [[ Searchability ]]
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.smartcase = true

-- [[ Lines ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = '80'

-- [[ Statusline ]]
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.laststatus = 0

-- [[ Splits ]]
vim.opt.splitbelow = true
vim.opt.splitright = true

-- [[ Indentation ]]
vim.opt.smartindent = true
vim.opt.smarttab = true

-- [[ Whitespaces ]]
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2

-- TODO: add a different colorscheme
vim.cmd[[colorscheme dracula]]
