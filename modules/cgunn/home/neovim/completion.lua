local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup {
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<CR>"] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "luasnip"}},
                                 {{name = "buffer"}})
}

cmp.setup.cmdline("/", {sources = {{name = "buffer"}}})

cmp.setup.cmdline(":", {
    sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})
})
