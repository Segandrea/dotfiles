local builtin = require('telescope.builtin')
return {
  -- See `:help telescope.builtin`

  -- [[ File pickers ]]
  -- List files in $CWD, respects .gitignore
  { mode = 'n', key = '<leader>tf',  act = builtin.find_files,            desc = '[f]ind files' },
  -- Search a string in $CWD, respects .gitignore
  { mode = 'n', key = '<leader>tg',  act = builtin.live_grep,             desc = '[g]rep files' },
  -- [[ Vim pickers ]]
  -- List open buffers
  { mode = 'n', key = '<leader>tb',  act = builtin.buffers,               desc = '[b]uffers' },
  -- List previously opened files
  { mode = 'n', key = '<leader>to',  act = builtin.oldfiles,              desc = '[o]ld files' },
  -- List and run commands on <CR>
  { mode = 'n', key = '<leader>tc',  act = builtin.commands,              desc = '[c]ommands list' },
  -- List neovim :help tags and opens them on <CR>
  { mode = 'n', key = '<leader>th',  act = builtin.help_tags,             desc = '[h]elp tags' },
  -- List manpages and opens them on <CR>
  { mode = 'n', key = '<leader>tm',  act = builtin.man_pages,             desc = '[m]anpages' },
  -- List spell suggestions
  { mode = 'n', key = '<leader>tS',  act = builtin.spell_suggest,         desc = '[S]pell suggestion list' },
  -- List normal mode commands
  { mode = 'n', key = '<leader>tk',  act = builtin.keymaps,               desc = '[k]eybindings' },
  -- [[ LSP pickers ]]
  -- List lsp references of the word under the cursor
  { mode = 'n', key = '<leader>tr',  act = builtin.lsp_references,        desc = '[r]eferences' },
  -- List lsp symbols in the document
  { mode = 'n', key = '<leader>ts',  act = builtin.lsp_document_symbols,  desc = '[s]ymbols' },
  -- List lsp symbols in the workspace
  { mode = 'n', key = '<leader>tw', act = builtin.lsp_workspace_symbols,  desc = '[w]orkspace symbols' },
  -- List diagnostics for all open buffers
  { mode = 'n', key = '<leader>td',  act = builtin.diagnostics,           desc = '[d]iagnostics' },
  -- Go to the implementation of the symbol under the cursor or show a list of implementations
  { mode = 'n', key = '<leader>ti',  act = builtin.lsp_implementations,   desc = '[i]mplementations' },
  -- Go to the definition of the symbol under the cursor or show a list of definitions
  { mode = 'n', key = '<leader>tD',  act = builtin.lsp_definitions,       desc = '[D]efinitions' },
  -- Go the the type def of the symbol under the cursor or show a list of type defs
  { mode = 'n', key = '<leader>tt',  act = builtin.lsp_type_definitions,  desc = '[t]ype def' },
  -- [[ Git pickers ]]
  -- List commits with diff preview
  { mode = 'n', key = '<leader>gc',  act = builtin.git_commits,           desc = '[c]ommit list' },
  -- List branches with log preview
  { mode = 'n', key = '<leader>gB',  act = builtin.git_branches,          desc = '[B]ranches list' },
  -- List changes of files with diff
  { mode = 'n', key = '<leader>gS',  act = builtin.git_status,            desc = '[S]tatus' },
  -- [[ Extensions pickers ]]
  { mode = 'n', key = '<leader>tp',  act = '<cmd>Telescope projects<CR>', desc = '[p]rojects list' },
}
