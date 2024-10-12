local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()
local lspconfig = require("lspconfig")

-- python
lspconfig.pyright.setup {capabilities = capabilities}

-- lua
lspconfig.lua_ls.setup {
    cmd = {"lua-language-server"},
    settings = {
        Lua = {diagnostics = {globals = {'vim'}}, telemetry = {enable = false}}
    },
    capabilities = capabilities
}

-- tex
lspconfig.texlab.setup {
    capabilities = capabilities,
    settings = {
        texlab = {
            build = {
                args = {
                    "-pdflua",
                    "-interaction=nonstopmode",
                    "-shell-escape",
                    "-synctex=1",
                    "%f"
                },
                onSave = true
            },
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

-- java 
lspconfig.java_language_server.setup {cmd = {"java-language-server"}}

-- lean
local lean = require("lean")
lean.setup {mappings = true}

-- eslint 
lspconfig.eslint.setup {}

-- EFM
lspconfig.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"nix", "python", "lua", "javascript", "verilog"},
    settings = {
        languages = {
            nix = {{formatCommand = "nixpkgs-fmt", formatStdin = true}},
            python = {
                {formatCommand = "isort --quiet -", formatStdin = true},
                {formatCommand = "black --quiet -", formatStdin = true}
            },
            lua = {
                {
                    formatCommand = "lua-format --chop-down-table -i",
                    formatStdin = true
                }
            },
            javascript = {
                {
                    formatCommand = "prettier --stdin-filepath ${INPUT}",
                    formatStdin = true
                }
            },
            verilog = {
                {formatCommand = "verible-verilog-format -", formatStdin = true}
            }

        }
    }
}

-- which key
local wk = require("which-key")

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        wk.register({
            g = {
                d = {vim.lsp.buf.definition, "Go to definition"},
                D = {vim.lsp.buf.declaration, "Go to declaration"},
                i = {vim.lsp.buf.implementation, "List implementations"},
                o = {vim.lsp.buf.type_definition, "Go to type definition"},
                r = {vim.lsp.buf.references, "List references"}
            },
            ["<leader>"] = {a = {vim.lsp.buf.code_action, "Code action"}}
        }, {mode = "n", prefix = "", buffer = event.buf})

        wk.register({["<C-a>"] = {vim.lsp.buf.code_action, "Code action"}},
                    {mode = "i", prefix = "", buffer = event.buf})
    end
})

wk.register({
    a = {vim.lsp.buf.code_action, "Code action"},
    e = {
        name = "+LSP",
        r = {vim.lsp.buf.rename, "Rename"},
        f = {
            function()
                vim.lsp.buf.format({
                    filter = function(client)
                        return client.name ~= "lua_ls"
                    end
                })
            end,
            "Format"
        },
        n = {
            function()
                vim.diagnostic.goto_next {popup_opts = {show_header = false}}
            end,
            "Next diagnostic"
        },
        p = {
            function()
                vim.diagnostic.goto_prev {popup_opts = {show_header = false}}
            end,
            "Next diagnostic"
        },
        k = {
            function()
                vim.diagnostic.open_float(0, {
                    scope = "line",
                    header = false,
                    focus = false
                })
            end,
            "Show all diagnostics"
        }
    }
}, {mode = "n", prefix = "<leader>", buffer = 0})

