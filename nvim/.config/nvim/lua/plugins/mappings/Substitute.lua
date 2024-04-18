local substitute = require('substitute')
-- Improve s command
return {
  { mode = 'n', key = 's',  act = substitute.operator, desc = '[s]ubstitute' },
  { mode = 'n', key = 'ss', act = substitute.line,     desc = '[s]ub[s]titute line' },
  { mode = 'n', key = 'S',  act = substitute.eol,      desc = '[s]ubstitute till eol' },
  { mode = 'x', key = 's',  act = substitute.visual,   desc = '[s]ubstitute' },
}
