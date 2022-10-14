require("mkdnflow").setup({
  perspective = { priority = 'current' },
  mappings = {
    MkdnNextLink = {'n', '<leader>nl'},
    MkdnPrevLink = {'n', '<leader>pl'},
    MkdnTableNextCell = {'i', '<C-l>'},
    MkdnTablePrevCell = {'i', '<C-h>'},
  },
})

vim.api.nvim_create_autocmd('FileType', { pattern = 'markdown', command = 'set awa' })
