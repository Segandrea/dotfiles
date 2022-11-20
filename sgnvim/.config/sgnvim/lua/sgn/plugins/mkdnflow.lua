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

-- [[ Markdown-preview config ]]
vim.b.mkdp_auto_start = 1

-- [[ Plugins mappings ]]
local map = require('sgn.core.mapper').map
map({
  -- Eval codeblocks (MdEval)
  { mode = 'n',          key = '<leader>me',  act = ':MdEval<cr>',                desc = '[e]val code' },
  -- Make table (MkdnFlow)
  { mode = 'n',          key = '<leader>mt',  act = ':MkdnTable 2 2 noh<CR>',     desc = '[t]able new' },
  -- Format table
  { mode = 'n',          key = '<leader>mf',  act = ':MkdnTableFormat<CR>',       desc = '[f]ormat table' },
  -- Remap mkdnflow default bindings adding description
  { mode = 'n',          key = '<leader>gnl', act = ':MkdnNextLink<CR>',          desc = '[l]ink' },
  { mode = 'n',          key = '<leader>gpl', act = ':MkdnPrevLink<CR>',          desc = '[l]ink' },
  { mode = 'n',          key = '<leader>gnh', act = ':MkdnNextHeading<CR>',       desc = '[h]eading' },
  { mode = 'n',          key = '<leader>gph', act = ':MkdnPrevHeading<CR>',       desc = '[h]eading' },
  { mode = 'n',          key = '<leader>ms',  act = ':MkdnMoveSource<CR>',        desc = '[s]ource rename' },
  { mode = { 'n', 'v' }, key = '<leader>mx',  act = ':MkdnToggleToDo<CR>',        desc = 'toggle checkbo[x]' },
  { mode = 'n',          key = '<leader>mr',  act = ':MkdnTableNewRowBelow<CR>',  desc = '[r]ow below' },
  { mode = 'n',          key = '<leader>mR',  act = ':MkdnTableNewRowAbove<CR>',  desc = '[R]ow above' },
  { mode = 'n',          key = '<leader>mc',  act = ':MkdnTableNewColAfter<CR>',  desc = '[c]ol after' },
  { mode = 'n',          key = '<leader>mC',  act = ':MkdnTableNewColBefore<CR>', desc = '[C]ol before' },
  { mode = 'n',          key = '<leader>mo',  act = 'o- [ ] ',                    desc = '[o]pen list item' },
  { mode = 'n',          key = '<leader>mO',  act = 'O- [ ] ',                    desc = '[O]pen list item' },
  -- Preview in pdf reader
  { mode = 'n',          key = '<leader>mp',  act = ':MarkdownPreviewToggle<CR>', desc = '[p]review' },
})
