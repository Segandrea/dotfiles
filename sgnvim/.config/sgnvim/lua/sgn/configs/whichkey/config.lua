return {
  plugins = {
    marks = false,
    registers = false,
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false,
    },
  },
  key_labels = {
    ['<CR>'] = 'RET',
    ['<space>'] = 'SPC',
  },
  popup_mappings = {
    scroll_down = '<C-j>',
    scroll_up = '<C-k>',
  },
  window = {
    border = 'double',
    margin = { 0, 0, 0, 0 },
    padding = { 1, 1, 1, 1 },
  },
  layout = {
    align = 'center',
  },
  triggers_blacklist = {
    n = { 'g' },
    v = { 'i', 'a' },
  },
}
