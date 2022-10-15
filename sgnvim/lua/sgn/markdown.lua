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

-- [[ Plugins mappings ]]
local map = vim.keymap.set
local options = function(description)
  return { noremap = true, silent = true, desc = description }
end

-- 'jbyuki/carrot.nvim' -- FIXME: works only with lua :'(
map('n', '<leader>mc', ':CarrotEval<cr>', options('[m]arkdown eval with [c]arrot'))
-- 'jbyuki/nabla.nvim'
map('n', '<leader>ml', require('nabla').popup, options('[m]arkdown render [l]atex'))
