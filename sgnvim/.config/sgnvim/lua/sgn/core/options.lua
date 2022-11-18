local o = {
  clipboard = 'unnamedplus',                           -- Use system clipboard
  smarttab = true,                                     -- Insert as many blanks as 'tabstop'
  listchars = 'trail:•,tab:  ,extends:ﲖ,precedes:ﲕ',  -- Strings to use in List mode (see wo.list)
  fillchars = 'eob: ',                                 -- Hide the ~ from the End Of Buffer
  scrolloff = 5,                                       -- Minimal number of lines to keep above/below the cursor
  sidescroll = 3,                                      -- Minimal number of columns to scroll horizontally
  sidescrolloff = 4,                                   -- Minimal number of columns to keep left/right of the cursor (see wo.wrap)
  encoding = 'utf-8',                                  -- String encoding used internally and for RPC communications
  laststatus = 0,                                      -- Don't show a statusline
  splitbelow = true,                                   -- New horizontal splits go below
  splitright = true,                                   -- New vertical splits go right
  hlsearch = true,                                     -- Highlight all match for search pattern
  incsearch = true,                                    -- Highlight matches while typing the search pattern
  ignorecase = true,                                   -- Ignore case in search patterns
  smartcase = true,                                    -- Overrides ignorecase if search pattern contains uppercase character
  updatetime = 250,                                    -- Update the .swp file faster (also used for 'CursorHold' events)
  completeopt = 'menuone,noselect',                    -- Options for vim builtin InsertMode's completion
  termguicolors = true,                                -- Enable 24-bit RGB color in TUI
  timeoutlen = 0,                                      -- Time to wait for a mapped sequence to complete
  showcmd = false,                                     -- Don't show partial command in the last line of the screen (see o.cmdheight)
  title = true,                                        -- Set window title to 'titlestring' (see o.titlestring)
  titlestring = '%t',                                  -- Show filename as 'title' (see o.title)
}

local wo = {
  list = true,                                         -- Enable List mode to show characters instead of blanks (see o.listchars)
  wrap = false,                                        -- Display lines that are too long on the next line
  breakindent = true,                                  -- Wrapped lines will be shown indented (see wo.wrap)
  conceallevel = 2,                                    -- Determine how concealable text is shown
  cursorline = true,                                   -- Highlight cursorline with a cursorlineopt (see wo.cursorlineopt)
  cursorlineopt = 'number',                            -- Style of the cursorline highlight (see wo.cursorline)
  foldenable = true,                                   -- Enable folding
  foldmethod = 'indent',                               -- Fold by indent
  foldlevel = 99,                                      -- Avoid automatic folding
  number = true,                                       -- Show line number
  relativenumber = true,                               -- Show relative line number above and below current line
  signcolumn = 'yes',                                  -- Show symbols in the column before the line numbers
}

local bo = {
  softtabstop = 2,                                     -- Number of spaces to use instead of tabs when pressing <tab> or <bs>
  expandtab = true,                                    -- In Insert mode use spaces instead of tabs
  shiftwidth = 2,                                      -- Number of spaces to use for autoindenting
  tabstop = 2,                                         -- Number of blanks when there is a tab instead of spaces
  undofile = true,                                     -- Make an undo file to save the history of changes to buffer
  fileencoding = 'utf-8',                              -- File-content encoding for the current buffer
  smartindent = true,                                  -- Do smart autoindenting when starting a new line (c-like)
}

for key, value in pairs(o) do
  vim.o[key] = value
end

for key, value in pairs(wo) do
  vim.wo[key] = value
end

for key, value in pairs(bo) do
  vim.bo[key] = value
end
