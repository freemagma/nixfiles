local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol
                                                          .make_client_capabilities())

local lspconfig = require("lspconfig")

-- python
lspconfig.pyright.setup {capabilities = capabilities}

-- lua
lspconfig.sumneko_lua.setup {
    cmd = {"lua-language-server"},
    settings = {Lua = {diagnostics = {globals = {'vim'}}}}
}

-- nix
lspconfig.rnix.setup {}

-- EFM
lspconfig.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua", "python"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = {
                {formatCommand = "isort --quiet -", formatStdin = true},
                {formatCommand = "black --quiet -", formatStdin = true}
            },
            lua = {{formatCommand = "lua-format -i", formatStdin = true}}
        }
    }
}

-- which key
local wk = require("which-key")

local mappings = {
    -- LSP
    e = {name = "+LSP", f = {"<cmd>lua vim.lsp.buf.formatting()<CR>", "Format"}}
}

local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false
}

wk.register(mappings, opts)
