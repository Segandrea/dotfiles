local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

-- adding spaces after brackets, it will be doubled
npairs.add_rule(Rule(' ', ' '):with_pair(function(opts)
  local pair = opts.line:sub(opts.col - 1, opts.col)
  return vim.tbl_contains({ '()', '[]', '{}' }, pair)
end):with_del(cond.none()))
