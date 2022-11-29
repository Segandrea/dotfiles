-- Register in whichkey names for markdown bindings
local whichkey_ok, whichkey = pcall(require, 'which-key')
local mkdnflow_ok, _ = pcall(require, 'mkdnflow')
if not whichkey_ok or not mkdnflow_ok then
  print('Error mapping mkdnflow for markdown')
  return
end

-- Apply whichkey label for markdown
whichkey.register({
  ['<leader>m'] = { name = '+[m]arkdown', },
})

require('sgn.core.keybinder').map({
  -- go in between when adding double underscores or double asterisk
  { mode = 'i',          key = '<space>_',    act = '__<left>',                   desc = 'autopair underscore' },
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

-- nvim-autopairs rules for markdown
local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
npairs.add_rule(Rule('$', '$', 'markdown'))
