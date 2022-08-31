local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol
                                                          .make_client_capabilities())
local lspconfig = require("lspconfig")
local lspconfig_util = require("lspconfig/util")

-- python
-- lspconfig.pyright.setup {capabilities = capabilities}

-- lua
-- lspconfig.sumneko_lua.setup {
--     cmd = {"lua-language-server"},
--     settings = {Lua = {diagnostics = {globals = {'vim'}}}},
--     capabilities = capabilities
-- }

-- nix
lspconfig.rnix.setup {
    capabilities = capabilities,
    root_dir = function(fname)
        return lspconfig_util.root_pattern(".git")(fname) or
                   lspconfig_util.path.dirname(fname)
    end
}

-- tex
lspconfig.texlab.setup {
    capabilities = capabilities,
    settings = {texlab = {build = {onSave = true}}}
}

-- ocaml
lspconfig.ocamllsp.setup {capabilities = capabilities}

-- EFM
lspconfig.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"python", "lua"},
    settings = {
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
