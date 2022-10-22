-- [[ MkdnFlow config ]]
require("mkdnflow").setup({
  perspective = { priority = 'current' },
  mappings = {
    -- leaving enabled only those not displayed by whichkey,
    -- remapping the other below.

    MkdnEnter = {{'i', 'n', 'v'}, '<CR>'}, -- make/follow link and fold headings
    MkdnTab = false, -- jump in next cell or indent list item
    MkdnSTab = false, -- jump in prev cell or deindent list item
    MkdnNextLink = false, -- go to next link
    MkdnPrevLink = false, -- go to prev link
    MkdnNextHeading = false, -- go to next heading
    MkdnPrevHeading = false, -- go to prev heading
    MkdnGoBack = {'n', '<BS>'}, -- go to previous buffer in history
    MkdnGoForward = false, -- go to next buffer in history
    MkdnFollowLink = false, -- see MkdnEnter
    MkdnDestroyLink = {'n', '<DEL>'}, -- unlink under cursor
    MkdnTagSpan = false, -- add section tag to be linked
    MkdnMoveSource = false, -- rename linked file
    MkdnYankAnchorLink = false, -- yank anchor link (?)
    MkdnYankFileAnchorLink = false, -- yank file (?)
    MkdnIncreaseHeading = false, -- increase heading
    MkdnDecreaseHeading = false, --decrease heading
    MkdnToggleToDo = false, -- toggle todo
    MkdnNewListItem = false, -- new list item
    MkdnExtendList = false, -- new list item but remain in line
    MkdnNewListItemBelowInsert = false, -- new item below and insert
    MkdnNewListItemAboveInsert = false, -- new item above and insert
    MkdnUpdateNumbering = false, -- update number of list
    MkdnTableNextCell = {'i', '<C-l>'}, -- go next table cell
    MkdnTablePrevCell = {'i', '<C-h>'}, -- go prev table cell
    MkdnTableNextRow = {'i', '<C-j>'}, -- go next table row
    MkdnTablePrevRow = {'i', '<C-k>'}, -- go prev table row
    MkdnTableNewRowBelow = false, -- add row below
    MkdnTableNewRowAbove = false, -- add row above
    MkdnTableNewColAfter = false, -- add col after
    MkdnTableNewColBefore = false, -- add col before
    MkdnFoldSection = false, -- fold current section (from header)
    MkdnUnfoldSection = false, -- unfold current section
  },
})
vim.api.nvim_create_autocmd('FileType', { pattern = 'markdown', command = 'set awa' })

-- [[ Markdown-preview config ]]
vim.b.mkdp_auto_start = 1

-- [[ Plugins mappings ]]
local map = vim.keymap.set
local options = function(description)
  return { noremap = true, silent = true, desc = description }
end

-- Eval codeblocks (MdEval)
map('n', '<leader>me', ':MdEval<cr>', options('[e]val code'))

-- Make table (MkdnFlow)
map('n', '<leader>mt', ':MkdnTable 1 1 noh<CR>', options('[t]able new'))
-- Format table
map('n', '<leader>mf', ':MkdnTableFormat<CR>', options('[f]ormat table'))
-- Remap mkdnflow default bindings adding description
map('n', '<leader>mnl', ':MkdnNextLink<CR>', options('[l]ink'))
map('n', '<leader>mpl', ':MkdnPrevLink<CR>', options('[L]ink'))
map('n', '<leader>mnh', ':MkdnNextHeading<CR>', options('[h]eading'))
map('n', '<leader>mph', ':MkdnPrevHeading<CR>', options('[H]eading'))
map('n', '<leader>ms', ':MkdnMoveSource<CR>', options('[s]ource rename'))
map({ 'n', 'v' }, '<leader>mb', ':MkdnToggleToDo<CR>', options('[b]ox toggle'))
map('n', '<leader>mr', ':MkdnTableNewRowBelow<CR>', options('[r]ow below'))
map('n', '<leader>mR', ':MkdnTableNewRowAbove<CR>', options('[R]ow above'))
map('n', '<leader>mc', ':MkdnTableNewColAfter<CR>', options('[c]ol after'))
map('n', '<leader>mC', ':MkdnTableNewColAfter<CR>', options('[C]ol before'))

-- Preview in pdf reader
map('n', '<leader>mw', ':MarkdownPreviewToggle<CR>', options('[p]review'))
