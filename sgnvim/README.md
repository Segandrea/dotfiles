# My neovim config in lua

## Structure

> Subject to changes
```
.
├── init.lua
├── lua/
│   └── sgn/
│       ├── autocmds/
│       │   └── init.lua
│       ├── init.lua
│       ├── mappings/
│       │   └── init.lua
│       ├── options/
│       │   └── init.lua
│       └── plugins/
│           ├── init.lua
│           ├── lspconfig.lua
│           ├── lsp-installer.lua
│           └── treesitter.lua
└── plugin/
    └── packer_compiled.lua
```

## TODOS:
- [] configure lsps
- [x] configure lsp installer
- [x] install which-key
- [x] mappings of the lsp with which-key
- [x] install completion plugins
- [x] install snippet plugins
- [x] add plugin for tmux split movement
- [] install autoclose plugin
- [] make differences between .md files and code files
- [] install something like vimwiki and markdown preview
- [] install dev icons
- [] install telescope
- [] make neovim ide-like
- [] search for useful plugins

