local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({
  disable_in_macro = true,
  check_ts = true,
  fast_wrap = {},
})

-- for markdown
npairs.add_rule(Rule("*", "*", "markdown"))
npairs.add_rule(Rule("_", "_", "markdown"))
npairs.add_rule(Rule("`", "`", "markdown"))
