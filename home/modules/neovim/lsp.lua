local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()
local lspconfig = require("lspconfig")
local lspconfig_util = require("lspconfig/util")

-- python
lspconfig.pyright.setup {capabilities = capabilities}

-- lua
lspconfig.sumneko_lua.setup {
    cmd = {"lua-language-server"},
    settings = {
        Lua = {diagnostics = {globals = {'vim'}}, telemetry = {enable = false}}
    },
    capabilities = capabilities
}

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
    settings = {
        texlab = {
            build = {onSave = true},
            forwardSearch = {
                executable = "zathura",
                args = {"--synctex-forward", "%l:1:%f", "%p"}
            }
        }
    }
}

-- ocaml
lspconfig.ocamllsp.setup {capabilities = capabilities}

-- zig 
lspconfig.zls.setup {capabilities = capabilities}

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
            lua = {
                {
                    formatCommand = "lua-format --chop-down-table -i",
                    formatStdin = true
                }
            }
        }
    }
}

-- which key
local wk = require("which-key")

local mappings = {
    -- LSP
    e = {
        name = "+LSP",
        f = {
            function()
                vim.lsp.buf.formatting()
                -- 0.8
                -- vim.lsp.buf.format({
                --     filter = function(client)
                --         return client.name ~= "sumneko_lua"
                --     end
                -- })
            end,
            "Format"
        }
    }
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
