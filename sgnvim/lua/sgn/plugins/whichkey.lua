-- Configurazione per whichkey
local conf = {
  window = {
    border = "double",
    position = "bottom",
    margin = { 0, 0, 0, 0 },
    padding = { 1, 1, 1, 1},
  },
}

-- Opzioni per i mappings
local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil, -- global settings, specifying a buffer makes it local to that
  silent = true,
  noremap = true,
  nowait = false,
}

-- Mappings da passare a whichkey
local mappings = {
  --[[ lsp keybindings ]]
  l = {
    name = "lsp",
    o = {
      -- see `:help vim.diagnostic.*` for doc on these
      name = "Floating diagnostics",
      e = { vim.diagnostic.open_float, "Diagnostic in floating window" },
      N = { vim.diagnostic.goto_prev, "Go previous diagnostic in buffer" },
      n = { vim.diagnostic.goto_next, "Go next diagnostic in buffer" },
      q = { vim.diagnostic.setloclist, "Add buffer diagnostics to the location list" },
    },
    g = {
      name = "Go to",
      D = { vim.lsp.buf.declaration, "Go to declaration" },
      d = { vim.lsp.buf.definition, "Go to definition" },
      t = { vim.lsp.buf.type_definition, "Go to type definition" },
    },
    w = {
      name = "Workspaces",
      a = { vim.lsp.buf.add_workspace_folder, "Add at workspaces folder" },
      r = { vim.lsp.buf.remove_workspace_folder, "Remove from workspaces folder" },
      l = { function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
        "Remove from workspaces folder"
      },
    },
    h = { vim.lsp.buf.hover, "Display hover info" },
    i = { vim.lsp.buf.implementation, "List implementations" },
    s = { vim.lsp.buf.signature_help, "Show signature" },
    r = { vim.lsp.buf.rename, "Rename" },
    a = { vim.lsp.buf.code_action, "Select a code action" },
    R = { vim.lsp.buf.references, "List references" },
    f = { vim.lsp.buf.formatting, "Format buffer" },
  },
}

local whichkeys = require("which-key")
whichkeys.setup(conf)
whichkeys.register(mappings, opts)

-- To check for conflicting keymaps do `:checkhealth which_key`
