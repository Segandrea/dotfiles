---WORKAROUND for folding with treesitter
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
---ENDWORKAROUND

require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  sync_install = true,
  auto_install = true,
  -- treesitter powered highlight
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- treesitter module that colors matching brackets and tags
  rainbow = {
    enable = true,
    extended_mode = true,
  },
  indent = {
    enable = true,
  },
})
