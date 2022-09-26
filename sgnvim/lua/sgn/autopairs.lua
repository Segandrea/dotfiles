local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({
  disable_in_macro = true,
  check_ts = true,
  fast_wrap = {},
})

-- my rules
npairs.add_rule(Rule(' ', ' '):with_pair(
  function (opts)
    local pair = opts.line:sub(opts.col - 1, opts.col)
    return vim.tbl_contains({ '()', '[]', '{}' }, pair)
  end
))

-- for markdown
npairs.add_rule(Rule("*", "*", "markdown"))
npairs.add_rule(Rule("_", "_", "markdown"))
npairs.add_rule(Rule("`", "`", "markdown"))
