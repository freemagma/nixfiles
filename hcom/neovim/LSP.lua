local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require("lspconfig")
lspconfig.pyright.setup { capabilities = capabilities }
