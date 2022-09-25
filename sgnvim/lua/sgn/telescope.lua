-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local map = vim.keymap.set
local builtin = require('telescope.builtin')
local options = function(description)
  return { noremap = true, silent = true, desc = description }
end
-- See `:help telescope.builtin`
map('n', '<leader>?', builtin.oldfiles, options('[?] Find recently opened files'))
map('n', '<leader><space>', builtin.buffers, options('[ ] Find existing buffers'))
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin
    .current_buffer_fuzzy_find(
      require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
      })
    )
end, options('[/] Fuzzily search in current buffer]'))

map('n', '<leader>sf', builtin.find_files, options('[S]earch [F]iles'))
map('n', '<leader>sh', builtin.help_tags, options('[S]earch [H]elp'))
map('n', '<leader>sw', builtin.grep_string, options('[S]earch current [W]ord'))
map('n', '<leader>sg', builtin.live_grep, options('[S]earch by [G]rep'))
map('n', '<leader>sd', builtin.diagnostics, options('[S]earch [D]iagnostics'))
