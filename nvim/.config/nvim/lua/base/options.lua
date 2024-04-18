-- Core options for the configuration
-- Will probably be overwritten by plugins

-- See `:help vim.g`
local g = {
  -- Set the mapleader to space
  mapleader = " ",
  maplocalleader = " ",
  -- Preview substitutions live
  inccommand = "split",
}

-- See `:help vim.opt`
local opt = {
  -- Strings to use in List mode (see wo.list)
  listchars = { trail = "•", tab = "ﲖ ", extends = "»", precedes = "ﲕ" },
  -- Use system clipboard
  clipboard = "unnamedplus",
  -- Insert as many blanks as 'tabstop'
  smarttab = true,
  -- Hide the ~ from the End Of Buffer
  fillchars = "eob: ",
  -- Minimal number of lines to keep above/below the cursor
  scrolloff = 5,
  -- Minimal number of columns to scroll horizontally
  sidescroll = 3,
  -- Minimal number of columns to keep left/right of the cursor (see wo.wrap)
  sidescrolloff = 4,
  -- String encoding used internally and for RPC communications
  encoding = "utf-8",
  -- Don't show a statusline
  laststatus = 0,
  -- New horizontal splits go below
  splitbelow = true,
  -- New vertical splits go right
  splitright = true,
  -- Highlight all match for search pattern
  hlsearch = true,
  -- Highlight matches while typing the search pattern
  incsearch = true,
  -- Ignore case in search patterns
  ignorecase = true,
  -- Overrides ignorecase if search pattern contains uppercase character
  smartcase = true,
  -- Update the .swp file faster (also used for 'CursorHold' events)
  updatetime = 250,
  -- Options for vim builtin InsertMode's completion
  completeopt = "menuone,noselect",
  -- Enable 24-bit RGB color in TUI
  termguicolors = true,
  -- Enable timeout
  timeout = true,
  -- Time to wait for a mapped sequence to complete
  timeoutlen = 0,
  -- Don't show partial command in the last line of the screen (see o.cmdheight)
  showcmd = false,
  -- Set window title to 'titlestring' (see o.titlestring)
  title = true,
  -- Show filename as 'title' (see o.title)
  titlestring = "%t",
  -- Enable List mode to show characters instead of blanks (see o.listchars)
  list = true,
  -- Display lines that are too long on the next line
  wrap = false,
  -- Wrapped lines will be shown indented (see wo.wrap)
  breakindent = true,
  -- Determine how concealable text is shown
  conceallevel = 2,
  -- Highlight cursorline with a cursorlineopt (see wo.cursorlineopt)
  cursorline = true,
  -- Style of the cursorline highlight (see wo.cursorline)
  cursorlineopt = "number",
  -- Enable folding
  foldenable = true,
  -- Fold by indent
  foldmethod = "indent",
  -- Avoid automatic folding
  foldlevel = 99,
  -- Show line number
  number = true,
  -- Show relative line number above and below current line
  relativenumber = true,
  -- Show symbols in the column before the line numbers
  signcolumn = "yes",
  -- Number of spaces to use instead of tabs when pressing <tab> or <bs>
  softtabstop = 2,
  -- In Insert mode use spaces instead of tabs
  expandtab = true,
  -- Number of spaces to use for autoindenting
  shiftwidth = 2,
  -- Number of blanks when there is a tab instead of spaces
  tabstop = 2,
  -- Make an undo file to save the history of changes to buffer
  undofile = true,
  -- File-content encoding for the current buffer
  fileencoding = "utf-8",
  -- Do smart autoindenting when starting a new line (c-like)
  smartindent = true,
}

-- Set globals
for key, value in pairs(g) do
  vim.g[key] = value
end

-- Set options
for key, value in pairs(opt) do
  vim.opt[key] = value
end
