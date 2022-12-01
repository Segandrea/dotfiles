-- Core autocmds for the configuration
-- Will probably be overwritten by plugins

-- Shorteing vim common functions
local autocmd = vim.api.nvim_create_autocmd -- see `:help vim.api.nvim_create_autocmd`
local augroup = vim.api.nvim_create_augroup -- see `:help vim.api.nvim_create_augroup`
local line = vim.fn.line                    -- see `:help line()` and `:help vim.fn`

-- Highlight on yank
local highlight_group = augroup( 'YankHighlight', { clear = true } )
autocmd('TextYankPost', {
  -- See `:help vim.highlight.on_yank()`
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = '*',
})

-- Do things entering insert mode
local insert_enter_group = augroup( 'InsertModeEnter', { clear = true } )
autocmd('InsertEnter', {
  callback = function()
    vim.o.hlsearch = false -- disable highlight
    vim.cmd.normal('zz')     -- center the view
  end,
  pattern = '*',
  group = insert_enter_group,
})

-- Save last editing position
local save_position_group = augroup( 'SavePosition', { clear = true } )
autocmd('BufReadPost', {
  callback = function()
    if line([['"]]) >= 1 and line([['"]]) <= line("$") then
      vim.cmd([[normal! g`"]])
    end
  end,
  pattern = '*',
  group = save_position_group,
})
