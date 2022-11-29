local align = require('align')
return {
  {
    desc = 'to [c]har',
    mode = 'x', key = '<leader>ac', act = function() align.align_to_char(1, true) end,
  },
  { -- be careful about this, hopefully it will get fixed.
    desc = 'to [s]string',
    mode = 'x', key = '<leader>as', act = function() align.align_to_string(false, true, false) end,
  },
}
