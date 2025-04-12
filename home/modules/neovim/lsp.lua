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
        wk.add({
            buffer = event.buf,
            {"<leader>a", vim.lsp.buf.code_action, desc = "Code action"},
            {"<C-a>", vim.lsp.buf.code_action, desc = "Code action", mode = "i"},
            {"gd", vim.lsp.buf.definition, desc = "Go to definition"},
            {"gD", vim.lsp.buf.declaration, desc = "Go to declaration"},
            {"gi", vim.lsp.buf.implementation, desc = "List implementations"},
            {"go", vim.lsp.buf.type_definition, desc = "Go to type definition"},
            {"gr", vim.lsp.buf.references, desc = "List references"}
        })
    end
})

wk.add({
    {"<leader>a", vim.lsp.buf.code_action, desc = "Code action"},
    {"<C-a>", vim.lsp.buf.code_action, desc = "Code action", mode = "i"},
    {"<leader>e", group = "LSP"},
    {"<leader>er", vim.lsp.buf.rename, desc = "Rename"},
    {
        "<leader>ef",
        function()
            vim.lsp.buf.format({
                filter = function(client)
                    return client.name ~= "lua_ls"
                end
            })
        end,
        desc = "Format"
    },
    {
        "<leader>en",
        function()
            vim.diagnostic.goto_next {popup_opts = {show_header = false}}
        end,
        desc = "Next diagnostic"
    },
    {
        "<leader>ep",
        function()
            vim.diagnostic.goto_prev {popup_opts = {show_header = false}}
        end,
        desc = "Previous diagnostic"
    },
    {
        "<leader>ek",
        function()
            vim.diagnostic.open_float(0, {
                scope = "line",
                header = false,
                focus = false
            })
        end,
        desc = "Show all diagnostics"
    }
})

