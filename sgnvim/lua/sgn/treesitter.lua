-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = 'all',
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {
      'markdown', -- render italics and bold
    },
  },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
  },
  -- [[ nvim-ts-rainbow ]]
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  -- [[ nvim-treesitter-textobjects ]]
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    -- TODO: change these keymaps
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
  autotag = {
    enable = true,
  },
}
