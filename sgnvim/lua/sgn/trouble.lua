local trouble = require('trouble')
trouble.setup({
  action_keys = {
    -- map to {} to remove a mapping, for example:
    -- close = {},
    close = { "q", "<ESC>" }, -- close the list
    cancel = {}, -- cancel the preview and get back to your last window / buffer / cursor
    jump = {}, -- jump to the diagnostic or open / close folds
    jump_close = { "<CR>" }, -- jump to the diagnostic and close the list
    hover = { "K" }, -- opens a small popup with the full multiline message
    preview = {}, -- preview the diagnostic location
    close_folds = { "zM", "zm" }, -- close all folds
    open_folds = { "zR", "zr" }, -- open all folds
    toggle_fold = { "zA", "za" }, -- toggle fold of current file
    previous = { "k" }, -- previous item
    next = { "j" }, -- next item
    refresh = { "<leader>r" }, -- manually refresh
    open_split = { "<leader>s" }, -- open buffer in new split
    open_vsplit = { "<leader>v" }, -- open buffer in new vsplit
    open_tab = { "<leader>t" }, -- open buffer in new tab
    toggle_mode = { "<leader>m" }, -- toggle between "workspace" and "document" diagnostics mode
    toggle_preview = { "<leader>p" }, -- toggle auto_preview
  },
  signs = {
    -- icons / text used for a diagnostic
    error = '',
    warning = '',
    hint = "",
    information = '',
  },
})

local map = vim.keymap.set
local options = function(description)
  return { noremap = true, silent = true, desc = description }
end

map('n', '<leader>w?', ':TroubleToggle workspace_diagnostics<CR>', options('problems[?] [w]here?'))
map('n', '<leader>?', ':TroubleToggle document_diagnostics<CR>', options('problems[??]'))
