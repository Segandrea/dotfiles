-- [[ MkdnFlow config ]]
require('mkdnflow').setup({
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

-- [[ Markdown-preview config ]]
vim.b.mkdp_auto_start = 1
