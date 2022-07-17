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
    flags = lsp_flags,
}

-- capabilities to be added to lsp from cmp_nvim_lsp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- basic configuration for every lsp
for server, _ in pairs(servers) do
    require('lspconfig')[server].setup {
        flags = lsp_flags,
        capabilities = capabilities,
    }
end
