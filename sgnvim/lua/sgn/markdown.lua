require("mkdnflow").setup({
  mappings = {
    MkdnNextLink = {'n', '<leader>nl'},
    MkdnPrevLink = {'n', '<leader>pl'},
    MkdnTableNextCell = {'i', '<C-l>'},
    MkdnTablePrevCell = {'i', '<C-h>'},
  },
})

-- FIXME: the remap of tab in essential.lua is not working on markdown
-- probably is overwritten by some shortcuts of mkdnflow
