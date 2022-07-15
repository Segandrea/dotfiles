local servers = {
    -- angular
    angularls = {},
    -- bash
    bashls = {},
    -- c/c++ (requires clang)
    --ccls = {},
    -- cmake
    cmake = {},
    -- css
    cssls = {},
    -- elixir
    elixirls = {},
    -- erlang (requires rebar3)
    --erlangls = {},
    -- gopls
    gopls = {},
    -- groovy
    groovyls = {},
    -- haskell (requires ghcup)
    --hls = {},
    -- html
    html = {},
    -- java
    jdtls = {},
    -- javascript/typescript
    tsserver = {},
    -- kotlin
    kotlin_language_server = {},
    -- latex
    texlab = {},
    -- lua
    --sumneko_lua = {},
    -- python
    pyright = {},
    -- ruby (requires gem)
    --solargraph = {},
    -- rust
    rust_analyzer = {},
    -- svelte
    svelte = {},
    -- vimL
    vimls = {},
    -- vue
    vuels = {},
    -- zig
    zls = {},
}

-- mappings lsp commands
local map = vim.keymap.set
local options = { noremap = true, silent = true }

-- see `:help vim.diagnostic.*` for doc on these
map('n', '<leader>e', vim.diagnostic.open_float, options)
map('n', '[d', vim.diagnostic.goto_prev, options)
map('n', ']d', vim.diagnostic.goto_next, options)
map('n', '<leader>q', vim.diagnostic.setloclist, options)

local on_attach = function(client, bufnr)
    -- completion trigghered with omnifunction (c-x c-o)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufoptions = { noremap = true, silent = true, buffer = bufnr }
    map('n', 'gD', vim.lsp.buf.declaration, bufoptions)
    map('n', 'gd', vim.lsp.buf.definition, bufoptions)
    map('n', 'K', vim.lsp.buf.hover, bufoptions)
    map('n', 'gi', vim.lsp.buf.implementation, bufoptions)
    map('n', '<c-k>', vim.lsp.buf.signature_help, bufoptions)
    map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufoptions)
    map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufoptions)
    map('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufoptions)
    map('n', '<leader>D', vim.lsp.buf.type_definition, bufoptions)
    map('n', '<leader>rn', vim.lsp.buf.rename, bufoptions)
    map('n', '<leader>ca', vim.lsp.buf.code_action, bufoptions)
    map('n', 'gr', vim.lsp.buf.references, bufoptions)
    map('n', '<leader>f', vim.lsp.buf.formatting, bufoptions)
end

local lsp_flags = {
    debounce_text_changes = 150,
}

-- remove element by key from table
function table.removekey(table, key)
    local element = table[key]
    table[key] = nil
    return element
end

-- particular configuration for sumneko_lua, the lua lsp
table.removekey(servers, 'sumneko_lua')
require('lspconfig').sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = on_attach,
    flags = lsp_flags,
}

-- basic configuration for every lsp
for server, _ in pairs(servers) do
    require('lspconfig')[server].setup {
        on_attach = on_attach,
        flags = lsp_flags,
    }
end
